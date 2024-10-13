------MOTIVATION------

This workflow helps me fit a keypair onto a sticker or a 1MB NFC card in a way that is portable and does not require another party to become familiar with an app or keyservers to establish secure communications without a prior shared secret. This is just an example of a simple offline back-of-the-envelope key management system that is easy to manage with small ed25519 keys. 

Included are example workflow scripts to generate either a single keypair, or a single keypair encrypted to a parent key; compressed and encoded to allow quick reading from a tap reader or printing on a QR code <2"x2".
Required open-source and cross-platform available dependencies: age, lz, base64, qrencode, zbarimg (from zbar or zbar-desktop).

Because AGE (or SSH) keys are small and don't support signing, it is effective to
    1. generate a parent key stored on the distributor's system
    2. generate a child keypair, for distribution to client and store this on the distributor's system, encrypted to the parent key, to serve as verification on the distributor's system.
    3. distribute the entire child keypair unencrypted along with the public key of the parent, compressed, as a single QR code or on a 1MB NFC tag.

Age and ed25519 ssh keys are small enough be to squeeze a compressed keypair+encrypted metadata+this repo with instructions in 1MB.
This can help facilitate one direction of an initial key exchange where the other party has not yet bootstrapped secure communications or become familiar with the relevant tools.

examples:
I can create keypairs for distribution to folks who will not read the gpg handbook along with my public key, and provide instructions for use later on, when the communication channel becomes necessary.
I can store credentials for my backup server in a file cabinet without relying on a flash drive to last the ages.
With minor adjustments I can:
    1. create a keypair for a client or employee, encrypted to a parent key for verification
    2. distribute an associated public key on an NFC card, for door access
    3. distribute an associated keypair and public key on a QR code on the face of the card, as a second factor and for the client to distribute.
    4. distribute an associated keypair for login authentication
 

for Rich, the most trusted man in the world; and, Rich.

------DEPENDS------
rage lzip qrencode zbar viewnior

------DISCLAIMER-------
This ReadME is hopefully more interesting than the bash one-liners included that just pipe a bunch of tried and tested tools together. This repo is just to keep my workflow using existing tools straight and highlight a way to make good use of existing original software. Please refer to those projects' licenses directly to incorporate a similar script into another application and use this workflow or derivative ideas yourself, freely, without involving or blaming me. Keep in mind I am advocating 1. managing your own keys, 2. using the most appropriate, efficient, existing algorithms, 3. offline on a piece of paper where that makes sense to do.

https://github.com/FiloSottile/age
https://github.com/mchehab/zbar
https://github.com/fukuchi/libqrencode
https://github.com/hellosiyan/Viewnior
https://www.nongnu.org/lzip/
