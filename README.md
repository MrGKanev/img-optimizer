# Image optimization bash script

![img-optimize](https://raw.githubusercontent.com/MrGKanev/img-optimizer/master/images/img-optimizer.png)

![GitHub](https://img.shields.io/github/license/mrgkanev/img-optimizer.svg) ![GitHub release](https://img.shields.io/github/release/mrgkanev/img-optimizer.svg) ![GitHub last commit](https://img.shields.io/github/last-commit/mrgkanev/img-optimizer.svg) ![Github stars](https://img.shields.io/github/stars/mrgkanev/img-optimizer.svg)

## Prerequisite

- [jpegoptim](https://github.com/tjko/jpegoptim) for jpg optimization
- [optipng](http://optipng.sourceforge.net/) for png optimization
- [cwebp](https://developers.google.com/speed/webp/docs/cwebp) for WebP conversion

### From APT repositories

Debian/Ubuntu :

```bash
sudo apt install jpegoptim optipng webp -y
```

Centos 7 :

```bash
sudo yum install optipng jpegoptim libwebp-tools -y
```

--------------------------------------------------------------------------------

## Installation

1) Clone the repository

```bash
git clone https://github.com/mrgkanev/img-optimizer.git $HOME/.img-optimize
```

2) Install the script

**Method 1** : Add an alias in .bashrc

With this method img-optimize can only be used by the current user

```bash
echo "alias img-optimize=$HOME/.img-optimize/optimize.sh" >> $HOME/.bashrc
source $HOME/.bashrc
```

**Method 2** : Add an alias to the script in /usr/local/bin

With this method img-optimize can be used by all users

```bash
sudo ln -s $HOME/.img-optimize/optimize.sh /usr/local/bin/img-optimize
sudo chmod +x /usr/local/bin/img-optimize
```

## Usage

```bash
Bash script to optimize your images and convert them in WebP
Usage: img-optimize [options] <images path>
If images path isn't defined, img-optimize will use the current directory
  Options:
       --jpg <images path> ..... optimize all jpg images
       --png <images path> ..... optimize all png images
       --webp <images path> ..... convert all images in webp
       --nowebp <images path> ..... optimize all png & jpg images
       --all <images path> ..... optimize all images (png + jpg + webp)
       -i, --interactive ..... run img-optimize in interactive mode
       -q, --quiet ..... run image optimization quietly
 Other options :
       -h, --help, help ... displays this help information
Examples:
  optimize all jpg images in /var/www/images
    img-optimize --jpg /var/www/images
```

## Update the script

To update the script, just run :

```bash
git -C $HOME/.img-optimize pull
```

## Setup daily cronjob

You just have to copy the scripts to /etc/cron.daily :

```bash
cp $HOME/.img-optimize/crons/jpg-png-cron.sh /etc/cron.daily/jpg-png-cron
cp $HOME/.img-optimize/crons/jpg-png-cron.sh /etc/cron.daily/webp-cron

chmod +x /etc/cron.daily/jpg-png-cron
chmod +x /etc/cron.daily/webp-cron
```

Then just edit your websites path set with the variables `sites` at the beginning of the cron scripts.

## Warning

Conversion process can take a while, you can use `tmux` to launch the script and be able to close your ssh connection without interrupting conversion. Then just use `tmux attach` to login back in your tmux session.

## Credits

- WebP conversion script was inspired by this [DigitalOcean Community Tutorial](https://www.digitalocean.com/community/tutorials/how-to-create-and-serve-webp-images-to-speed-up-your-website)

- Tutorial about webp conversion available on [jesuisadmin.fr](https://jesuisadmin.fr/convertir-vos-images-en-webp-nginx/) (in french)
  
- VirtuBox open sourcing they're img-optimize script
