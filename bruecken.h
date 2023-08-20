typedef struct INT_ARRAY{
    int *array;
    int length;
}int_array;

typedef struct PLATEAU{
    int nummer;
    int_array verbindungen;
}plateau;

void speicher_freigeben(plateau **plats, int anzahl_plats);
int read_plats(char *filepath, plateau **plats, int *anzahl_plats, int verschiebung);
void initialisiere_verbindungsarrays(plateau **p, int start, int ende);
void extend_array(int_array *a);