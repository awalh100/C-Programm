#include "bruecken.h"

#include <stdio.h>
#include <stdlib.h>

// ./bruecken [eingabedateien...] ausgabedatei
// ./bruecken g_0.txt g_1.txt out_0_1.txt
int main(int argc, char *argv[]) {
    if (argc < 3) return 1;

    plateau *plats = NULL;  // plateau 1 -> plats[0], plateau 87 -> plats[86]
    int anzahl_plats = 0;
    int verschiebung = 0;
    for (int i = 1; i < argc - 1; i++) {
        int gelesen = read_plats(argv[i], &plats, &anzahl_plats, verschiebung);
        if (gelesen == 2) {
            if (plats != NULL) {
                speicher_freigeben(&plats, anzahl_plats);
            }
            return 2;
        }
        if (verschiebung != 0) {  //bedeutet, wir hatten vorher eine andere datei
            extend_array(&plats[verschiebung - 1].verbindungen);
            plats[verschiebung - 1].verbindungen.array[plats[verschiebung - 1].verbindungen.length - 1] = plats[verschiebung].nummer;
            extend_array(&plats[verschiebung].verbindungen);
            plats[verschiebung].verbindungen.array[plats[verschiebung].verbindungen.length - 1] = plats[verschiebung - 1].nummer;
        }
        verschiebung = anzahl_plats;
    }

    //herausfinden ob es eine lösung gibt

    /*
        Alle Plats haben gerade anzahl an verbindungen -> beliebig
        Genau 2 Plats haben ungerade anzahl an verbindungen -> die beiden plats printen
        Ansonsten -> Keine Lösung
    */
    int anzahl_ungerade = 0;
    int_array ungerade_positionen = {.array = NULL, .length = 0};
    for (int i = 0; i < anzahl_plats; i++) {
        if (plats[i].verbindungen.length % 2 != 0) {
            anzahl_ungerade++;
            extend_array(&ungerade_positionen);
            ungerade_positionen.array[ungerade_positionen.length - 1] = i;
        }
    }

    FILE *out = fopen(argv[argc - 1], "w");
    int geoeffnet = 0;
    if (out) {
        geoeffnet = 1;
        if (anzahl_ungerade == 0) {
            fprintf(out, "beliebig\n");
        } else if (anzahl_ungerade == 2) {
            fprintf(out, "%d\n", plats[ungerade_positionen.array[0]].nummer);
            fprintf(out, "%d\n", plats[ungerade_positionen.array[1]].nummer);
        } else {
            fprintf(out, "keine Lösung\n");
        }
        fclose(out);
    }

    free(ungerade_positionen.array);
    speicher_freigeben(&plats, anzahl_plats);

    if (geoeffnet == 0) {
        return 2;
    }
    return 0;
}

void speicher_freigeben(plateau **plats, int anzahl_plats) {
    for (int i = 0; i < anzahl_plats; i++) {
        free((*plats)[i].verbindungen.array);
    }
    free(*plats);
}

int read_plats(char *filepath, plateau **plats, int *anzahl_plats, int verschiebung) {
    FILE *in = fopen(filepath, "r");
    if (!in) {
        return 2;
    }

    int plat1 = 0;
    int plat2 = 0;
    while (fscanf(in, "%d %d", &plat1, &plat2) != EOF) {
        int akt_plat_nummer = plat2 + verschiebung;
        if (plat1 + verschiebung > plat2 + verschiebung) {
            akt_plat_nummer = plat1 + verschiebung;
        }

        if (*plats == NULL) {
            *plats = malloc(sizeof(plateau) * akt_plat_nummer);
            initialisiere_verbindungsarrays(plats, 0, akt_plat_nummer);
            *anzahl_plats = akt_plat_nummer;
        }
        if (akt_plat_nummer > *anzahl_plats) {
            *plats = realloc(*plats, sizeof(plateau) * akt_plat_nummer);
            initialisiere_verbindungsarrays(plats, *anzahl_plats, akt_plat_nummer);
            *anzahl_plats = akt_plat_nummer;
        }

        (*plats)[plat1 + verschiebung - 1].nummer = plat1 + verschiebung;
        (*plats)[plat2 + verschiebung - 1].nummer = plat2 + verschiebung;
        extend_array(&((*plats)[plat1 + verschiebung - 1].verbindungen));
        extend_array(&((*plats)[plat2 + verschiebung - 1].verbindungen));

        (*plats)[plat1 + verschiebung - 1].verbindungen.array[(*plats)[plat1 + verschiebung - 1].verbindungen.length - 1] = plat2 + verschiebung;
        (*plats)[plat2 + verschiebung - 1].verbindungen.array[(*plats)[plat2 + verschiebung - 1].verbindungen.length - 1] = plat1 + verschiebung;
    }
    fclose(in);
    return 0;
}

void initialisiere_verbindungsarrays(plateau **p, int start, int ende) {
    for (int i = start; i < ende; i++) {
        (*p)[i].verbindungen.array = NULL;
        (*p)[i].verbindungen.length = 0;
    }
}

//erweitert int_array um 1, oder erstellt es falls nötig
void extend_array(int_array *a) {
    if (a->array == NULL) {
        a->array = malloc(sizeof(int));
        a->array[0] = 0;
        a->length++;
        return;
    }
    a->array = realloc(a->array, sizeof(int) * (a->length + 1));
    a->array[a->length] = 0;
    a->length++;
}