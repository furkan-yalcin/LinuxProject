#!/bin/sh
zenity --question \
       --title "Devam etmek için onaylayın" \
       --text "wc (word count) komutunu kullanmak istiyor musunuz?"
ans1=$?
if [[ $ans1 = 0 ]]
then
	ans2=$(zenity --file-selection \
	       --title "wc Komutunu Kullanmak İstediğiniz Dosyayı Seçin" \
	       --filename "/home/${USER}/")

elif [[ $ans1 = 1 ]]
then
	exit
fi

ans3=$(zenity --list \
       --column "İşlem" \
       --width 620 \
       --height 300 \
       "wc : Sırasıyla dosyadaki satır sayısını, kelime sayısını ve byte cinsinden boyutunu yazdırır." \
       "wc -l : Dosyadaki satır sayısını yazdırır." \
       "wc -w : Dosyadaki kelime sayısını yazdırır." \
       "wc -c : Dosyanın byte cinsinden boyutunu yazdırır." \
       "wc -m : Dosyadaki karakter sayısını yazdırır." \
       "wc -L : Dosyadaki en uzun satırın karakter sayısını yazdırır.")

case $ans3 in
"wc : Sırasıyla dosyadaki satır sayısını, kelime sayısını ve byte cinsinden boyutunu yazdırır.")
	out1=$(wc < $ans2)
        zenity --info \
               --title "Satır Sayısı, Kelime Sayısı ve Byte Cinsinden Boyut" \
               --text "Seçtiğiniz dosyanın sırasıyla satır sayısı, kelime sayısı ve byte cinsinden boyutu : $out1"
        ;;
"wc -l : Dosyadaki satır sayısını yazdırır.")
	out2=$(wc -l < $ans2)
	zenity --info \
	       --title "Satır Sayısı" \
	       --text "Seçtiğiniz dosyadaki satır sayısı : $out2"
	;;
"wc -w : Dosyadaki kelime sayısını yazdırır.")
	out3=$(wc -w < $ans2)
	zenity --info \
               --title "Kelime Sayısı" \
               --text "Seçtiğiniz dosyadaki kelime sayısı : $out3"
	;;
"wc -c : Dosyanın byte cinsinden boyutunu yazdırır.")
	out4=$(wc -c < $ans2)
        zenity --info \
               --title "Byte Cinsinden Boyut" \
               --text "Seçtiğiniz dosyanın byte cinsinden boyutu : $out4"
	;;
"wc -m : Dosyadaki karakter sayısını yazdırır.")
	out5=$(wc -m < $ans2)
        zenity --info \
               --title "Karakter Sayısı" \
               --text "Seçtiğiniz dosyadaki karakter sayısı : $out5"
	;;
"wc -L : Dosyadaki en uzun satırın karakter sayısını yazdırır.")
	out6=$(wc -L < $ans2)
        zenity --info \
               --title "En Uzun Satırın Karakter Sayısı" \
               --text "Seçtiğiniz dosyadaki en uzun satırın karakter sayısı : $out6"
	;;
esac
