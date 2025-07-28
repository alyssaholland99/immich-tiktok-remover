pwd
ls
sed -i -e 's/easyocr\=\=1\.7\.1/#\ Removed\ EasyOCR/g' requirements.txt
sed -i -e 's/import\ easyocr/#\ Removed\ EasyOCR/g' /drone/src/src/image_verification.txt
sed -i -e 's/from\ image_verification\ import\ processVideo\,\ verifyVideoNameAndDate/#\ Removed\ EasyOCR/g' /drone/src/src/immich_tiktok_remover.txt
