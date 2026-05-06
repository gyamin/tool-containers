# ImageMagickコンテナの利用

### イメージのビルド
```
% docker build -t image_magick . 
% docker images
REPOSITORY     TAG       IMAGE ID       CREATED          SIZE
image_magick   latest    4029df29a1fa   16 minutes ago   494MB
```

### コンテナ実行
```
% docker run -it --name image_magick -v ~/Desktop/NXStudio:/mnt image_magick:latest
root@61e32a0b43b5:/#
```

## 利用例

### jpegファイルをpdfに変換 
```
root@cd73fa7babce:~# cd /mnt/
root@cd73fa7babce:/mnt# ls -l
total 50744
-rw-r--r-- 1 root root 1452032 Feb  8 13:00 Z50_3092.JPG
-rw-r--r-- 1 root root 1304045 Feb  8 13:00 Z50_3093.JPG
…
root@cd73fa7babce:/mnt# convert *.JPG output.pdf
root@cd73fa7babce:/mnt# ls -l | grep *.pdf
-rw-r--r-- 1 root root 37281502 Feb  9 05:49 output.pdf
```

### heic画像をjpegに変換
[heic_to_jpeg.sh](src/heic_to_jpeg.sh) を実行
```
root@cb3332aec672:/# cd /src/
root@cb3332aec672:/src# bash heic_to_jpeg.sh 
Processing: IMG_8799.HEIC
    1 image files updated
```