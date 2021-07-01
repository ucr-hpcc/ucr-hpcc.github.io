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
npm audit fix

# Remove old build
rm -rf ./public

# Try setting permissions via umask
umask 022

# Generate html public dir
HUGO_ENV="production" hugo --config config.toml --cacheDir /tmp/hugo_cache_${USER} --baseURL / --gc || exit 1
rm -rf /tmp/hugo_cache_${USER}

# Build with blogdown instead
#module unload R
#module load R/4.1.0_gcc-8.3.0
#Rscript -e "blogdown::build_site()"

# Update perms
echo "Fixing file perms"
find . -type f -exec chmod a+r {} \;
echo "Fixing dir perms"
find . -type d -exec chmod a+rx {} \;

# You can run a local server
#hugo server --themesDir themes/docsy

# Ensure that your symlink is in place
# Also be sure that all parent directories are at least world execute
#ln -s ${PWD}/public ~/.html/hpcc_new_site

