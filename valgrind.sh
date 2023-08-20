#!/bin/bash

echo "Valgrindtest eine Eingabe, eine Lösung"
X=0
2>&1 valgrind --log-file=valgrind_eingabe_$X.log ./bruecken g_$X.txt test_out_muell.txt  > /dev/null 
grep -qE "([^0]|[0-9]0) bytes in" valgrind_eingabe_$X.log &&  echo -e "\t... Speicherleck bei ./bruecken g_$X.txt test_out_muell.txt gefunden. Details in Datei valgrind_eingabe_$X.log" || echo -e "\t ...OK\n"

X=10
2>&1 valgrind --log-file=valgrind_eingabe_$X.log ./bruecken g_$X.txt test_out_muell.txt  > /dev/null 
grep -qE "([^0]|[0-9]0) bytes in" valgrind_eingabe_$X.log &&  echo -e "\t... Speicherleck bei ./bruecken g_$X.txt test_out_muell.txt gefunden. Details in Datei valgrind_eingabe_$X.log" || echo -e "\t ...OK\n"

echo "Valgrindtest eine Eingabe, viele Lösungen"

X=3
2>&1 valgrind --log-file=valgrind_eingabe_$X.log ./bruecken g_$X.txt test_out_muell.txt  > /dev/null 
grep -qE "([^0]|[0-9]0) bytes in" valgrind_eingabe_$X.log &&  echo -e "\t... Speicherleck bei ./bruecken g_$X.txt test_out_muell.txt gefunden. Details in Datei valgrind_eingabe_$X.log" || echo -e "\t ...OK\n"

X=7
2>&1 valgrind --log-file=valgrind_eingabe_$X.log ./bruecken g_$X.txt test_out_muell.txt  > /dev/null 
grep -qE "([^0]|[0-9]0) bytes in" valgrind_eingabe_$X.log &&  echo -e "\t... Speicherleck bei ./bruecken g_$X.txt test_out_muell.txt gefunden. Details in Datei valgrind_eingabe_$X.log" || echo -e "\t ...OK\n"

echo "Valgrindtest eine Eingabe, keine Lösung"
X=1
2>&1 valgrind --log-file=valgrind_eingabe_$X.log ./bruecken g_$X.txt test_out_muell.txt  > /dev/null 
grep -qE "([^0]|[0-9]0) bytes in" valgrind_eingabe_$X.log &&  echo -e "\t... Speicherleck bei ./bruecken g_$X.txt test_out_muell.txt gefunden. Details in Datei valgrind_eingabe_$X.log" || echo -e "\t ...OK\n"

X=8
2>&1 valgrind --log-file=valgrind_eingabe_$X.log ./bruecken g_$X.txt test_out_muell.txt  > /dev/null 
grep -qE "([^0]|[0-9]0) bytes in" valgrind_eingabe_$X.log &&  echo -e "\t... Speicherleck bei ./bruecken g_$X.txt test_out_muell.txt gefunden. Details in Datei valgrind_eingabe_$X.log" || echo -e "\t ...OK\n"

echo "Valgrindtest mehrere Eingabedateien"
X=0
Y=3
2>&1 valgrind --log-file=valgrind_eingabe_$X_$Y.log ./bruecken g_$X.txt g_$Y.txt test_out_muell.txt  > /dev/null 
grep -qE "([^0]|[0-9]0) bytes in" valgrind_eingabe_$X_$Y.log &&  echo -e "\t... Speicherleck bei ./bruecken g_$X.txt g_$Y.txt test_out_muell.txt gefunden. Details in Datei valgrind_eingabe_$X.log" || echo -e "\t ...OK\n"

X=3
Y=3
2>&1 valgrind --log-file=valgrind_eingabe_$X_$Y.log ./bruecken g_$X.txt g_$Y.txt test_out_muell.txt  > /dev/null 
grep -qE "([^0]|[0-9]0) bytes in" valgrind_eingabe_$X_$Y.log &&  echo -e "\t... Speicherleck bei ./bruecken g_$X.txt g_$Y.txt test_out_muell.txt gefunden. Details in Datei valgrind_eingabe_$X.log" || echo -e "\t ...OK\n"

echo "Valgrindtest zu wenige Parameter"
X=zu_wenig
2>&1 valgrind --log-file=valgrind_eingabe_$X.log ./bruecken g_1.txt  > /dev/null 
grep -qE "([^0]|[0-9]0) bytes in" valgrind_eingabe_$X.log &&  echo -e "\t... Speicherleck bei ./bruecken g_1.txt gefunden. Details in Datei valgrind_eingabe_$X.log" || echo -e "\t ...OK\n"

echo "Valgrindtest Eingabedatei kann nicht gelesen werden"
X=notreadable
2>&1 valgrind --log-file=valgrind_eingabe_$X.log ./bruecken g_1.txt $X.txt test_out_muell.txt > /dev/null 
grep -qE "([^0]|[0-9]0) bytes in" valgrind_eingabe_$X.log &&  echo -e "\t... Speicherleck bei ./bruecken g_1.txt $X.txt test_out_muell.txt gefunden. Details in Datei valgrind_eingabe_$X.log" || echo -e "\t ...OK\n"
