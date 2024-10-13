#!/bin/bash
# Decodes QR code containing data that was compressed through lzip and then base64 encoded.
# depends: age lzip zbarimg
echo QR code debase and extract
echo Path?
read path
cd $path &&
echo filename? (.png)
read file
echo "Base64 encoded QR code will be decoded"
echo 'Verify:';
zbarimg -q --raw $file.png | base64 -d | lzip -d
exit
