$startscript = <<SCRIPT
export PREFIX="/usr/local/i386elfgcc"
export TARGET=i386-elf
export PATH="$PREFIX/bin:$PATH"

sudo apt-get update

# install nasm assembler
sudo apt-get install -y nasm


# mkdir /tmp/src
# cd /tmp/src
# curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz # If the link 404's, look for a more recent version
# tar xf binutils-2.24.tar.gz
# mkdir binutils-build
# cd binutils-build
# ../binutils-2.24/configure --target=$TARGET --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=$PREFIX 2>&1 | tee configure.log
# make all install

# cd /tmp/src
# curl -O https://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2
# tar xf gcc-4.9.1.tar.bz2
# mkdir gcc-build
# cd gcc-build
# ../gcc-4.9.1/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
# make all-gcc 
# make all-target-libgcc 
# make install-gcc 
# make install-target-libgcc 
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/precise32"
    config.vm.provision "shell", inline: $startscript

  end