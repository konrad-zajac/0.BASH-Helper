function inc_dir
{
let poprzedni_numer=-1
for plik in $(ls -1 | grep "[0-9][0-9].*");do
    let numer=$(echo $plik | sed -e "s/^0*//" | cut -d. -f1)
    tekst=$(echo $plik | cut -d. -f2-)
        if [ $poprzedni_numer -eq $numer ];then
            let numer=$numer+1
            nowy_plik=$(printf "%02d.%s" $numer $tekst)
            mv $plik $nowy_plik
        fi
    let poprzedni_numer=$numer
done
}