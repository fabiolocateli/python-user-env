#!/bin/bash

#MYLOCALDIR=$1

MYLOCALDIR=~/myLocal
PKGDIR=~/pkgSrc
LAPACKLIB=~/pkgSrc/tarballs/lapack-3.4.2.tgz

export LD_LIBRARY_PATH=$MYLOCALDIR/lib
export PATH=$MYLOCALDIR/bin:$PATH
echo $MYLOCALDIR $LD_LIBRARY_PATH

# Unpack the directory
tar xvf pkgSrc.tar.gz

cd pkgSrc/tarballs

# Build Bzip2
tar xvf bzip2-1.0.6.tar.gz
cd bzip2-1.0.6
make -f Makefile-libbz2_so
make
make install PREFIX=$MYLOCALDIR
cd ../

# Build sqlite3
tar xvf sqlite-autoconf-3071700.tar.gz
cd sqlite-autoconf-3071700
./configure --prefix=$MYLOCALDIR
make
make install
cd ../

# Build ncurses
tar xvf ncurses-5.9.tar.gz
cd ncurses-5.9
./configure --with-shared --prefix $MYLOCALDIR
make
make install
cd ../

# Build readlines
tar xvf readline-master.tar.gz
cd readline-master
./configure --with-shared --prefix $MYLOCALDIR
make
make install
cd ../

# Build openssl
tar xvf openssl-1.0.1e
cd openssl-1.0.1e
./config --prefix=$MYLOCALDIR shared
make
make install
cd ../

# Build Python
tar xvf Python-2.7.5.tgz
cd Python-2.7.5
./configure --prefix=$MYLOCALDIR --enable-shared
make
make install
cd ../

# Building algebra packages:
cd ../../
cd $MYLOCALDIR
mkdir opt
mkdir opt/ATLASBuild

cd opt/ATLASBuild
~/pkgSrc/tarballs/ATLAS/configure --prefix=$MYLOCALDIR -Fa alg -fPIC --with-netlib-lapack-tarfile=$LAPACKLIB
#make
#make install
#cd ../../../

# From now on: Python libraries

# Setuptools
cd pkgSrc/tarballs
tar xvf setuptools*
cd setuptools*
python setup.py install --prefix=$MYLOCALDIR
cd ../

# Nose
tar xvf nose*
cd nose*
python setup.py install --prefix=$MYLOCALDIR
cd ..

# Cython
tar xvf Cython*
cd Cython*
python setupegg.py install --prefix=$MYLOCALDIR
cd ../../

# Numpy
cd numpy
python setupegg.py install --prefix=$MYLOCALDIR
cd ..

# Scipy
cd scipy
python setupegg.py install --prefix=$MYLOCALDIR
cd ..

# Networkx
cd networkx 
python setup_egg.py install --prefix=$MYLOCALDIR
cd ..

# traits
cd traits
python setup.py install --prefix=$MYLOCALDIR
cd ..

# Nibabel
cd nibabel
python setup_egg.py install --prefix=$MYLOCALDIR
cd ..

# Nipype
cd nipype
python setup_egg.py install --prefix=$MYLOCALDIR
cd ..

# END
