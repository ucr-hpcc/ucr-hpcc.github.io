#!/bin/bash -l

###########################################
# Did you clone this repo with recursive? #
###########################################
#git clone --recurse-submodules --depth 1 https://github.com/my/example.git

#################################################################
# Remember to modify your config to reflect the proper base URL #
#################################################################

####################################
# Downlad and install Hugo and npm #
####################################
#mkdir -p ~/bigdata/src/hugo
#cd ~/bigdata/src/hugo
#wget https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_extended_0.83.1_Linux-64bit.tar.gz
#tar -xf hugo_extended_0.83.1_Linux-64bit.tar.gz

#mkdir -p ~/bigdata/src/npm
#cd ~/bigdata/src/npm
#wget https://nodejs.org/dist/v16.3.0/node-v16.3.0-linux-x64.tar.xz
#tar -xf node-v16.3.0-linux-x64.tar.xz

# Load hugo
#module load hugo
export PATH=~/bigdata/src/hugo:$PATH
module load GCC/8.3.0

# Load newer git
module load git

# Load npm
#module load npm
export PATH=~/bigdata/src/npm/node-v16.3.0-linux-x64/bin:$PATH

# Only do this once
#npm install -D --save autoprefixer
#npm install -D --save postcss-cli

# Remove old build
rm -rf public/

# Try setting permissions via umask
umask 022

# Generate html public dir
HUGO_ENV="production" hugo --config config.toml --cacheDir /tmp/hugo_cache_${USER} --gc || exit 1
rm -rf /tmp/hugo_cache_${USER}
#hugo server --themesDir themes/docsy

# Update file permissions
#find public/ -type f -exec chmod a+r {} \;
#find public/ -type d -exec chmod a+rx {} \;

