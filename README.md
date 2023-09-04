Bruecken


 Einführung
Man hat sich an einem Seil in eine Hoehle herabgelassen. Dort sieht man viele,
teilweise mit Haengebrucken verbundene, Felsplateaus. Auf jeder Bruecke liegt ein Goldbarren, 
den man gerne einsammeln moechte. Allerdings sieht man, dass eine Brucke, sobald Sie sie einmal
uberquert haben, reißen wird. Bevor man nun Ihr Rettungsseil loslassen, muss man daher wissen,
auf welches Felsplateau man sich schwingen muss und von welchem Plateau man von seinem
Rettungsteam wieder eingesammelt werden koennen.

 Eingabe:
 Als Eingabe bekommt man beliebig viele Dateien. Fur jede Datei gilt:
 
• In jeder Zeile stehen zwei Zahlen, diese stehen fur zwei miteinander verbundene Felspla- 
teaus.
• Es gibt keine Brucken von einem Plateau zu sich selber (Loops).

• Die Felsplateaus sind fortlaufend nummeriert (beginnend bei 1).

• man weißt nicht vorab, wie viele Plateaus es gibt.

• Falls es mehrere Eingabedateien gibt, wird immer eine Verbindung zwischen dem Plateau mit der hoechsten Nummer in der zuerst stehenden Eingabedatei mit dem mit der
niedrigsten Nummer in der direkt darauf folgenden Datei hinzugefugt.

Manipulation der Plateaunummern: Da alle Eingabedateien die Z¨ahlung der Plateaus mit
1 beginnen, muss man die Plateaunummern manipulieren. wird man die Zahlen ab 1 fuer
die erste Eingabedatei verwenden. 

DAnn faehrt man fuer jede weitere Eingabedatei bei der jeweils naechsten ganzen
Zahl fort.

 Beispiel:
 
man hat zwei Eingabedateien. Die erte beinhaltet 5 Plateaus (Nummern 1-5) und die
zweite 3 Plateaus (Nummern 1-3). Nach der Manipulation hat man die Plateaus 1-8. Weiterhin
wird eine Verbindung zwischen 5 und 6 hinzugefuegt. 

 Ausgabe:

In die Ausgabedatei soll folgendes geschrieben werden:

• beliebig, wenn man an jedem Felsplateau beginnen und enden kann.

• in die erste Zeile das Startplateau, in die zweite Zeile das Zielplateu (hierbei soll immer
Startplateau < Zielplateau gelten), wenn es genau eine Loesung gibt.

• keine Loesung
Jede Ausgabedatei endet mit einem Zeilenumbruch (\n).

 Loesungsfindung:
 
Man muss keinen Weg ueber die Plateaus finden. Es reicht, wenn der Programm
 herausfindet, ob es eine Loesung gibt, und wenn ja wie viele. Dies kann man wie folgt
erkennen:

• Wenn jedes Felsplateau mit einer geraden Anzahl Brucken verbunden ist, so kann man
an jedem Plateau starten.

• Wenn genau zwei Fesplateaus mit einer ungeraden Anzahl Bruecken verbunden sind, so
ist eines davon das Start-, das andere das Zielplateau.
• In allen anderen Faellen gibt es keine Loesung


Wichtige Anforderungen an das Programm:
• Der Speicher fur die Bruecken muss dynamisch alloziert werden.

• Insbesondere darf dieser also nicht statisch alloziert werden.

• Vor Beendigung des Programms muss der gesamte Speicher wieder freigegeben werden.
Dies gilt auch fur geoeffnete Dateien.

• Valgrind darf weder Speicherzugriffsverletzungen noch Speicherlecks melden. Valgrind
sollte auch keine anderen Fehler melden.

• Alle Funktionen sowie gegebenenfalls Strukturen sollen in einer Headerdatei deklariert
werden.

• Sie durfen nie mehr als eine Datei gleichzeitig geoeffnet haben. Keine Datei darf mehr als
einmal geoeffnet oder geschlossen werden.

Das Programm soll im Fehlerfall eine kurze aussagekraeftige Meldung ausgeben und folgende
Rueckgabewertehaben:

• 0, wenn das Programm ordnungsgemaeß laufen konnte

• 1, wenn nicht genuegend Parameter uebergeben werden.

• 2, wenn eine der Ein- oder Ausgabedateien nicht geoeffnet werden konnte.

Aufruf des Programms: Das Programm bekommt beim Aufruf den Namen der Ein- und der
Ausgabedatei uebergeben. Beispiele: 
./bruecken eingabe.txt ausgabe.txt
./bruecken eingabe1.txt eingabe2.txt ausgabe.txt
