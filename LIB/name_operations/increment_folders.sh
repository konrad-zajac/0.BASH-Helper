#!/bin/bash
function increment_folders
{
let poprzedni_numer=-1
for plik in $(ls -1 | grep "[0-9][0-9].*")
do
	#echo $plik
	let numer=$(echo $plik | sed -e "s/^0*//" | cut -d. -f1)
	tekst=$(echo $plik | cut -d. -f2-)
	#echo Numer: $numer Tekst: $tekst
	if [ $poprzedni_numer -eq $numer ]
	then
		#echo Duplikat!!!
		let numer=$numer+1
		nowy_plik=$(printf "%02d.%s" $numer $tekst)
		mv $plik $nowy_plik
	fi
	#printf "%02d.%s\n" $numer $tekst
	let poprzedni_numer=$numer
done
}
