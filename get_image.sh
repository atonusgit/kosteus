#!/bin/bash

. ~/kosteus/.env

echo "send progress_1%"
ssh pi@pistorasiat.local bash $PISTORASIAT_ROOT_DIRECTORY/send_to_ws.sh "progress_1%_luodaan-tiedostonimi-..."

echo "set filename"
image_file='/cameras/'$(date +%y%m%d_%H%M%S)'_kosteus.jpg'

echo "send progress_30&"
ssh pi@pistorasiat.local bash $PISTORASIAT_ROOT_DIRECTORY/send_to_ws.sh "progress_30%_otetaan-kuva-..."

echo "take image"
#libcamera-still -o $image_file
raspistill -o $image_file

echo "send progress_60%"
ssh pi@pistorasiat.local bash $PISTORASIAT_ROOT_DIRECTORY/send_to_ws.sh "progress_60%_vie-kuva-valle.fi:hin-..."

echo "send to valle.fi"
scp $image_file valle@77.240.19.49:/home/valle/public_html/pusula/kamerat/acctv_kuva.jpg

echo "send progress_90%"
ssh pi@pistorasiat.local bash $PISTORASIAT_ROOT_DIRECTORY/send_to_ws.sh "progress_90%_vie-kuva-dropboxiin-..."

echo "send to dropbox"
bash $ROOT_DIRECTORY/send_to_dropbox.sh $image_file

echo "send uusi_kuva"
ssh pi@pistorasiat.local bash $PISTORASIAT_ROOT_DIRECTORY/send_to_ws.sh "uusi_kuva"

echo "remove image"
rm $image_file
