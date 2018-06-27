# My Slackware

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

- Install *snopkg* check their page [sbopkg.org](https://sbopkg.org/downloads.php)

- To install Mannually some stuff from slackbuilds you have to download the 
SlackBuild and sometimes the source Downloads

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
but you can use the next url:

```bash
git clone https://gitlab.com/skaendo/csb-extras/tree/14.2 
```

and follow the next stops, but you want to read the advices from Skaendo
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

... and *LUCK* with that!!!...

