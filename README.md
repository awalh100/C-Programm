= Bruecken
:icons: font
:icon-set: fa
:source-highlighter: rouge
:experimental:
ifdef::env-github[]
:tip-caption: :bulb:
:note-caption: :information_source:
:important-caption: :heavy_exclamation_mark:
:caution-caption: :fire:
:warning-caption: :warning:
endif::[]
:toc:
:toc-placement!:

toc::[]

= Man hat sich an einem Seil in eine Hoehle herabgelassen. Dort sieht man viele,
teilweise mit Haengebrucken verbundene, Felsplateaus. Auf jeder Bruecke liegt ein Goldbarren, 
den man gerne einsammeln moechte. Allerdings sieht man, dass eine Brucke, sobald Sie sie einmal
uberquert haben, reißen wird. Bevor man nun Ihr Rettungsseil loslassen, muss man daher wissen,
auf welches Felsplateau man sich schwingen muss und von welchem Plateau man von seinem
Rettungsteam wieder eingesammelt werden koennen.

== Eingabe:
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

== Beispiel:
man hat zwei Eingabedateien. Die erte beinhaltet 5 Plateaus (Nummern 1-5) und die
zweite 3 Plateaus (Nummern 1-3). Nach der Manipulation hat man die Plateaus 1-8. Weiterhin
wird eine Verbindung zwischen 5 und 6 hinzugefuegt. 

== Ausgabe:
In die Ausgabedatei soll folgendes geschrieben werden:
• beliebig, wenn man an jedem Felsplateau beginnen und enden kann.

• in die erste Zeile das Startplateau, in die zweite Zeile das Zielplateu (hierbei soll immer
Startplateau < Zielplateau gelten), wenn es genau eine Loesung gibt.
• keine Loesung
Jede Ausgabedatei endet mit einem Zeilenumbruch (\n).

== Loesungsfindung:
Sie mussen keinen Weg uber die Plateaus finden. Es reicht, wenn Ihr Pro- ¨
gramm herausfindet, ob es eine L¨osung gibt, und wenn ja wie viele. Dies k¨onnen Sie wie folgt
erkennen:
• Wenn jedes Felsplateau mit einer geraden Anzahl Brucken verbunden ist, so k ¨ ¨onnen Sie
an jedem Plateau starten.
• Wenn genau zwei Fesplateaus mit einer ungeraden Anzahl Brucken verbunden sind, so ¨
ist eines davon das Start-, das andere das Zielplateau.
• In allen anderen F¨allen gibt es keine L¨osung

Wichtige Anforderungen an das Programm:
• Der Speicher fur die Br ¨ ucken muss dynamisch alloziert werden. ¨
• Insbesondere darf dieser also nicht statisch alloziert werden.
• Vor Beendigung des Programms muss der gesamte Speicher wieder freigegeben werden.
Dies gilt auch fur ge ¨ ¨offnete Dateien.
• Valgrind darf weder Speicherzugriffsverletzungen noch Speicherlecks melden. Valgrind
sollte auch keine anderen Fehler melden.
• Alle Funktionen sowie gegebenenfalls Strukturen sollen in einer Headerdatei deklariert
werden.
• Sie durfen nie mehr als eine Datei gleichzeitig ge ¨ ¨offnet haben. Keine Datei darf mehr als
einmal ge¨offnet oder geschlossen werden.
Das Programm soll im Fehlerfall eine kurze aussagekr¨aftige Meldung ausgeben und folgende
Ruckgabewerte ¨ haben:
• 0, wenn das Programm ordnungsgem¨aß laufen konnte
• 1, wenn nicht genugend Parameter ¨ ubergeben werden. ¨
• 2, wenn eine der Ein- oder Ausgabedateien nicht ge¨offnet werden konnte.
Aufruf des Programms: Das Programm bekommt beim Aufruf den Namen der Ein- und der
Ausgabedatei ubergeben. Beispiele: ¨
./bruecken eingabe.txt ausgabe.txt
./bruecken eingabe1.txt eingabe2.txt ausgabe.txt
