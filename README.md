# My Slackware

This file is going to be a wiki-blog, so don't pay attention until 
I finish it... also my english and my ortographic are bad...

# Installation

Maybe you want to read this text before using Slackware [Instalar-slackware-sin-morir-en-el-intento](https://www.ochobitshacenunbyte.com/2015/11/18/instalar-slackware-sin-morir-intento/
)

For the installation you have to download the iso from the official page
[slackware-iso](https://mirrors.slackware.com/slackware/slackware-iso/
)
and after make an bootteable USB.

My installation is very simple. But you can make an LVM installation or make
a disk encryption.

For LVM check this: [LVM-slackware](http://www.slackware.com/~alien/archive/13.1/README_LVM.TXT)

For disk encryption check: [encryption-disk](https://blog.darknedgy.net/technology/2014/07/27/1/)

# After Installation

## Users 

Add an user and modify your sudoers file. Never work with root unless it is necessary.

to add an user do
```bash
$ adduser user
```

where user is the name of your user, and when it says that add and
**Adittional UNIX groups** press the **up key** and you will add
the group **wheel** to your user.

## Permission

Edit you sudoers file
You must be as **root** to do this.

You can write 
```bash
# vi /etc/sudoers
```

or
```bash
# visudo
```

and *uncomment* the line **#%wheel ALL=(ALL) ALL** to 
**%wheel ALL=(ALL) ALL** to permit our user
to do things like a root and whoever in the wheel group (but not all)

# Change the language

To change your language system 

The next command show you the languages availables for you.
```bash
# locale -a
```

after see if you language is available edit the next files
*/etc/profile.d/lang.sh* 
*/etc/profile.d/lang.csh*
in my case I select es\_ES.utf-8
and change **export LANG=en_US** to **export LANG=es_ES.utf-8**
and "setenv **LANG en_US** to **setenv LANG es_ES.utf8** 

# Mirrors

Uncomment your favorite link in **/etc/slackpkg/mirrors**, 
I uncomment the first but you can 
uncomment what you want.


## Sbopkg and Libreoffice

- To install **snopkg** check their page [sbopkg.org](https://sbopkg.org/downloads.php)

And example to install with sbopkg

```bash
sbopkg -i libreoffice
```

To translate LibreOffice to Spanish you have to download your 
language package.

```bash
$ wget http://download.documentfoundation.org/libreoffice/stable/4.2.3/rpm/x86_64/LibreOffice_4.2.3_Linux_x86-64_rpm_helppack_es.tar.gz

$ wget http://download.documentfoundation.org/libreoffice/stable/4.2.3/rpm/x86_64/LibreOffice_4.2.3_Linux_x86-64_rpm_langpack_es.tar.gz
```

And run the scripts

```bash
ARCH=x86_64 ./libreoffice-helppack.SlackBuild
ARCH=x86_64 ./libreoffice-langpack.SlackBuild
```

For the case of 32 bits remove **_64**

Intall the packages generating

```bash
installpkg /tmp/libreoffice-helppack-4.2.3_es-x86-64-1_SBo.tgz
installpkg /tmp/libreoffice-langpack-4.2.3_es-x86-64-1_SBo.tgz
```

And for 32 bits.

```bash
installpkg /tmp/libreoffice-helppack-4.2.3_es-i586-1_SBo.tgz
installpkg /tmp/libreoffice-langpack-4.2.3_es-i586-1_SBo.tgz
```

- To install Mannually some stuff from slackbuilds you have to download the 
SlackBuild and sometimes the source Downloads.

For example:

```bash
$ wget -c https://www.slackbuilds.org/slackbuilds/14.2/desktop/screenfetch.tar.gz -O screenfetch
$ cd ./screenfetch
$ wget https://github.com/KittyKatt/screenFetch/archive/v3.8.0/screenFetch-3.8.0.tar.gz
$ ./screenfetch.SlackBuild
# installpkg /tmp/[DIRECTORY]
```

The directory is given by the ./file.SlackBuild, you can see it in the latest line
when you run the .SlackBuild file.

You can see this: [SlackBuild-Usage-HOWTO](https://slackbuilds.org/howto/)

# Cinnamon

I like Cinnamon-Desktop so, for install it check this page.
[cinnamon-desktop-for-slackware](https://edpsblog.wordpress.com/2017/11/04/how-to-cinnamon-no-slackware/)

I installed Slackware-14.2 in 64 bits so I have to run this commands
some file are old so you have to check the URL's 

```bash
$ mkdir cinnamon && cd cinnamon/
$ lftp -c "open https://slackware.uk/csb/14.2/; mirror x86_64"
$ cd x86_64/
$ su
# upgradepkg --reinstall --install-new *.t?z 2>&1 | tee cinnamon-install.log
# exit
$ xwmconfig
``` 

This is important... because after installing extras for cinnamon my 
desktop crashed and I suffered a lot.
I will check this commands and improve it in a future.

```bash
$ git clone https://github.com/CinnamonSlackBuilds/csb/tree/14.2 cinnamon-extras
$ cd cinnamon-extras
$ su
# chmod +x build-extras.sh
# ./build-extras.sh
```

As you notice I change the url and download the 14.2 branch
but you can use the Skaendo url:

```bash
git clone https://gitlab.com/skaendo/csb-extras/tree/14.2 
```

and follow the next steps, but you want to read the advices from Skaendo
and Willy Studiarto Raharjo. Because you have to download and install your
correct version.

# Removing Cinnamon

To remove cinnamon do this:

```bash
# removepkg /var/log/packages/*_csb
# removepkg /var/log/packages/*1csbe
``` 

Unless you installed cinnamon from Slackpkg+. If not my case, but it is your case check the page 
[cinnamon-desktop-for-slackware](https://edpsblog.wordpress.com/2017/11/04/how-to-cinnamon-no-slackware/)

... and **LUCK** with that!!!...

