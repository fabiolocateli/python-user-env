== Step 1: Obtaining Package files ==
* You should perform these operations from a computer connected both to internet and to Kore. For example an internal FBK host, like spivey.

 mkdir pkgSrc
 mkdir pkgSrc/tarballs
 
 cd pkgSrc/tarballs
 # Linear algebra packages
 wget http://sourceforge.net/projects/math-atlas/files/latest/download # ATLAS library
 wget http://www.netlib.org/lapack/lapack-3.4.2.tgz # Lapack Library
 # Python Modules sources
 wget http://www.sqlite.org/2013/sqlite-autoconf-3071700.tar.gz
 wget http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz
 wget http://www.sqlite.org/2013/sqlite-autoconf-3071700.tar.gz
 wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
 wget http://git.savannah.gnu.org/cgit/readline.git/snapshot/readline-master.tar.gz
 wget http://www.openssl.org/source/openssl-1.0.1e.tar.gz
 # Python and python libraries
 wget http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz # Python
 wget https://pypi.python.org/packages/source/s/setuptools/setuptools-0.7.4.tar.gz # Python Setup-tools
 wget https://pypi.python.org/packages/source/n/nose/nose-1.3.0.tar.gz --no-check-certificate # Nose test tool
 wget http://cython.org/release/Cython-0.19.1.tar.gz # Cython
 cd ..
 # Next sources are cloned directly from their git repository
 git clone https://github.com/scipy/scipy.git # Scipy
 git clone https://github.com/networkx/networkx.git # Networkx
 git clone https://github.com/nipy/nibabel.git # Nibabel
 git clone https://github.com/nipy/nipype.git # Nipype
 git clone https://github.com/enthought/traits.git
 cd ..

* I suggest to first compress the local repositories:
 tar cvf pkgSrc.tar.gz pkgSrc

* and then send it to kore
 scp pkgSrc.tar.gz yourusername@korein.fbk.eu:/nilab0/

* From kore, unpack the tarball we just

