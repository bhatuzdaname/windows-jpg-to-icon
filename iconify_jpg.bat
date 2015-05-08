set str=%cd%
set temp=%str:\=\\%
set name=%temp%\\image.png

identify -ping -format "%%w" poster.jpg> tmp.txt
set /p width=<tmp.txt
echo.%width%
identify -ping -format "%%h" poster.jpg> tmp.txt
set /p height=<tmp.txt
echo.%height%
set /a w=(512*%width%)/%height%
del tmp.txt

java -jar -Xmx1024m "C:\Program Files (x86)\ImageJ\ij.jar" "poster.jpg" -eval "run('Size...', 'width=%w% height=512 constrain average interpolation=Bilinear');run('Canvas Size...', 'width=512 height=512 position=Center');saveAs('PNG', '%name%');run('Quit');"

mkdir tmp
convert image.png -resize 512x512 tmp\image-512.png
convert tmp\image-512.png -resize 256x256 tmp\image-256.png
convert tmp\image-512.png -resize 128x128 tmp\image-128.png
convert tmp\image-512.png -resize 64x64 tmp\image-64.png
convert tmp\image-512.png -resize 32x32 tmp\image-32.png
convert tmp\image-512.png -resize 16x16 tmp\image-16.png
attrib -S -H -R "image.ico"
convert tmp\image-16.png tmp\image-32.png tmp\image-64.png tmp\image-128.png tmp\image-256.png tmp\image-512.png image.ico
rmdir /Q /S tmp
attrib +H image.ico
del image.png

attrib -S -H -R "desktop.ini"
attrib -S -H -R "Desktop.ini"

@echo [.ShellClassInfo] > Desktop.ini
@echo ConfirmFileOp=0 >> Desktop.ini
@echo NoSharing=1 >> Desktop.ini
@echo IconResource=image.ico,0 >> Desktop.ini

attrib +S +H +R Desktop.ini
cd ..
attrib +R "%str%"

