#!/bin/bash
# Generates age keypair, compresses through lzip, base64 encodes for ASCII and generates a QR code.
# reasonably small for printed distribution or sending to an NFC writer
# depends: age lzip qrencode zbarimg
echo AGE key compressed qr generator
echo Path?
read path
cd $path &&
echo ID name?
read file
if test -f "$file"; then
	echo "file exists, exiting"
	exit
	fi
if test -f "$file".png; then
	echo "file exists, exiting"
	exit
	fi
if test -f "$file".lz; then
	echo "file exists, exiting"
	exit
	fi
echo "AGE generation - priv and pubkeys will be encoded"
age-keygen -o $file && lzip -9 $file --output=$file.lz;
cat $file.lz | base64 | qrencode -t PNG -o $file.png && rm -f $file.lz && viewnior $file.png; echo 'Verify:';
zbarimg -q --raw $file.png | base64 -d | lzip -d
exit
