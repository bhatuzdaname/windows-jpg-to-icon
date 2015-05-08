#Windows: Set a JPEG file as folder icon.#

###Pre-requisites###
1. [Java Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
2. [ImageJ](http://rsb.info.nih.gov/ij/download.html)
3. [ImageMagick](http://www.imagemagick.org/script/binary-releases.php)

Ensure that java is added to the PATH variable.
Now the script assumes that the ImageJ jar file is in __'C:\Program Files (x86)\ImageJ\ij.jar'__ directory. If not change line no. __14__ appropriately to reflect the location of __ij.jar__.

###Script Usage###
1. Rename your image to __poster.jpg__ and place it in the folder whose icon you want to change.
2. Place the script in that folder.
3. Open folder in terminal [Shift + Right Click -> Open in Terminal].
4. Close all open __windows explorer__ windows.
5. Enter `iconify_jpg` in terminal and press enter.

You will see ImageJ open to center and resize the image. Next imagemagick converts the new image to an icon file and the script adds a Desktop.ini file with path of icon and necessary folder attributes.

Step 4 is not necessary but is done so that you see the icon change immediately otherwise you need to wait for windows to rebuild it's thumbnail cache which may require a reboot.