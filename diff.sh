#!/bin/bash

echo -e "\n######################################################"
echo -e "# Tests mit ungültigen Aufrufen\n"

echo -e "#\n# Test Ohne Parameter\n#"
./bruecken > /dev/null
if [ $? -eq 1 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi

echo -e "#\n# Test Mit nur einem Parameter\n#"
./bruecken g_0.txt > /dev/null
if [ $? -eq 1 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi

echo -e "#\n# Test Eingabedatei kann nicht gelesen werden\n#"
./bruecken notreadable.txt test_out_muell.txt > /dev/null
if [ $? -eq 2 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi

echo -e "#\n# Test zweite Eingabedatei kann nicht gelesen werden\n#"
./bruecken g_0.txt notreadable.txt test_out_muell.txt > /dev/null
if [ $? -eq 2 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi

echo -e "#\n# Test Ausgabedatei kann nicht geschrieben werden\n#"
./bruecken g_0.txt notreadable.txt > /dev/null
if [ $? -eq 2 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi


echo -e "\n######################################################"
echo -e "# Eine Eingabe, Lösung eindeutig\n"

X=0
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

X=5
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

X=4
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

X=10
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

echo -e "\n######################################################"
echo -e "# Eine Eingabe, Lösung nicht eindeutig\n"

X=3
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

X=6
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

X=7
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

echo -e "\n######################################################"
echo -e "# Eine Eingabe, keine Lösung \n"

X=1
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

X=2
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

X=8
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

X=9
echo -e "Teste Eingabe g_$X.txt"
./bruecken g_$X.txt test_out_$X.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_$X.txt out_$X.txt || echo -e "\t Die Ausgabedatei test_out_$X.txt ist nicht korrekt."

echo -e "\n######################################################"
echo -e "# Zwei Eingaben - wir testen die Projekte nach Abgabe auch mit mehr als zwei Dateien \n"

echo -e "Teste Eingabe g_0.txt und g_3.txt"
./bruecken g_0.txt g_3.txt test_out_0_3.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_0_3.txt out_0_3.txt || echo -e "\t Die Ausgabedatei test_out_0_3.txt ist nicht korrekt."

echo -e "Teste Eingabe g_3.txt und g_3.txt"
./bruecken g_3.txt g_3.txt test_out_3_3.txt > /dev/null
if [ $? -eq 0 ]
	then echo -e "\t...Rückgabe: OK"
	else echo -e "\t...Rückgabewert stimmt nicht."
fi
diff test_out_3_3.txt out_3_3.txt || echo -e "\t Die Ausgabedatei test_out_3_3.txt ist nicht korrekt."


echo -e "#\n# ... Tests abgeschlossen"
echo -e "######################################################"


