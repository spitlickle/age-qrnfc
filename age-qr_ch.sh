#!/bin/bash
# Generates age keypair, compresses through lzip, base64 encodes for ASCII and generates a QR code of the keypair
# followed by a parent public key.
# reasonably small for printed distribution or sending to an NFC writer while keeping keys organized structurally.
# depends: age lzip qrencode zbarimg
echo AGE key compressed qr generator - child
echo Path?
read path
cd $path &&
echo ID name?
read file
echo Parent ID .pub?
read parent
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
echo "AGE generation - priv and pubkeys will be encoded along with a parent pubkey"
age-keygen -o $file && cat $parent >> $file && lzip -9 $file --output=$file.lz;
cat $file.lz | base64 | qrencode -t PNG -o $file.png && rm -f $file.lz && viewnior $file.png;
echo 'Verify:';
zbarimg -q --raw $file.png | base64 -d | lzip -d
exit
