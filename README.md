# Lawnchair Magisk

![Header Image](https://raw.githubusercontent.com/saitamasahil/Lawnchair_Magisk/main/banner.png)

The Lawnchair Magisk module offers a comprehensive solution, featuring an array of Lawnicons, compatibility with both Android 12L and 13, support for Navigation Gestures and integration of the Google Feed(Lawnfeed), all within a single convenient Magisk module package. This streamlines the setup process and eliminates the need to access multiple sources.

### Features
- Simple to install. Just flash & forget.
- 6 Different types of lawnicons available. Desired lawnicons can be selected while flashing in magisk. [Check Preview](https://telegra.ph/Lawnicons-Preview-01-30) of these themed icons here.
- Out of the box navigation gestures support with proper animations.

### Compatibility
- Android 12L
- Android 13

### Prerequisites
- Device rooted by [Magisk latest stable](https://github.com/topjohnwu/Magisk/releases/latest).

### Installation
- Uninstall any other launcher if you're using one. Only keep the default launcher.
- Download the module installation file from [Download Links](#download-links) available.
- Flash the file in Magisk and select your desired Lawnicons using volume keys.
- Reboot your device and go to **Settings** > **Apps** > **Default apps** > **Home app** and make sure **Lawnchair Magisk** is selected.

### Uninstallation
- Simply uninstall module from Magisk

## Download Links
- [Mirror 1](https://www.pling.com/p/1980061)
- [Mirror 2](https://store.kde.org/p/1980061)
- [Mirror 3](https://www.opendesktop.org/p/1980061)

## Building from source

### For Ubuntu, Debian, and other Linux distributions
- The required zip package install command is in the script itself. However, if you encounter any errors, you can install **zip** manually. On Ubuntu or Debian, Use the following command to do so."
```sh
sudo apt install zip
```
- Now clone the repo using git.
```sh
git clone --depth=1 https://github.com/saitamasahil/Lawnchair_Magisk
```
- Navigate to the **Lawnchair_Magisk** folder.
```sh
cd Lawnchair_Magisk
```
- Run autobuild.sh.
```sh
bash autobuild.sh
```
- Use below command to update repo if you have already cloned it before.
```sh
git pull
```

### For Termux
- Open Termux, copy & paste this command:
```sh
termux-setup-storage
```
and give Termux storage access. If you get this warning "It appears that directory '~/storage' already exists. This script is going to rebuild its structure from scratch, wiping all dangling files. The actual storage content is not going to be deleted" then just do press "y". It won't do any harm to your device.
- Now copy & paste this command:
```sh
pkg upgrade || true
pkg install -y git
rm -rf Pixel-Launcher-Extended
git clone --depth=1 https://github.com/saitamasahil/Lawnchair_Magisk
cd Lawnchair_Magisk
bash autobuild.sh
mv Lawnchair\ Magisk* /sdcard
echo "Your magisk module is available in Internal Storage"
```
- Please make sure to grant storage permissions, if Termux asks you to do so, you will get Magisk module in your internal storage.
- Choose Offline Installer, Online Installer or Customize Installer using number keys.
- Use [Termux From F-Droid](https://f-droid.org/en/packages/com.termux/) to perform these tasks.
- The required zip package install command is in the script itself. However, if you encounter any errors, you can install **zip** manually. Use the following command to do so."
```sh
pkg install zip
```
- Use below command to update repo if you have already cloned it before.
```sh
cd Lawnchair_Magisk
git pull
```

## Credits/Thanks
- [Lawnchair](https://github.com/LawnchairLauncher/lawnchair)
- [LiArch55](http://telegram.me/LiArch55)
- [MrSluffy](https://github.com/MrSluffy)
- [cayicons](https://www.coolapk.com/apk/app.lawnchair.lawnicons)
- [WaifuPX-DG](https://github.com/WaifuPX-DG)
- [RKBDI](https://github.com/RadekBledowski)
- [TeamFiles](https://github.com/TeamFiles)
- [ACons](https://telegram.me/acons_icons)

Brought to you by [saitamasahil](https://github.com/saitamasahil)!