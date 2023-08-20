compile: # TODO ergänzen Sie hier mit den üblichen Parametern der Veranstaltung und so, dass die Skripte funktionieren können.
	gcc bruecken.c -o bruecken -Wall -std=c99

clean: # TODO loeschen Sie das ausführbare Programm, alle zu Testzwecken erstellten Ausgaben und die valgrind logs
	rm -f test_out*.txt valgrind_*.log

prepare:
	touch notreadable.txt
	chmod u-rw notreadable.txt

diff: prepare compile diff.sh
	@echo "**********************************************************************************************************"
	@echo "Achtung: Die Ausgabe kann falsch positiv sein, falls Dateien zwischendurch nicht gelöscht werden."
	@echo "Falls die geschriebenen Dateien den Erwartungen entsprechen werden Sie nur eine Rückmeldung zu den"
	@echo "Rückgabewerten sehen. Ansonsten auch ein diff der Dateien."
	@echo "**********************************************************************************************************"
	./diff.sh

valgrind: prepare compile valgrind.sh
	./valgrind.sh
