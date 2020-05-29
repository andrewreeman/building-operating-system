$startscript = <<SCRIPT
export PREFIX="/usr/local/i386elfgcc"
export TARGET=i386-elf
export PATH="$PREFIX/bin:$PATH"

sudo apt-get update

# install nasm assembler
sudo apt-get install -y nasm
mkdir src
cd src

# better to wget with output as something more generic
wget https://ftp.gnu.org/gnu/gcc/gcc-10.1.0/gcc-10.1.0.tar.gz
tar xfv gcc-10.1.0.tar.gz 

wget https://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.gz
tar xfv binutils-2.34.tar.gz

sudo apt-get install bison -y
sudo apt-get install flex -y
sudo apt-get install libgmp3-dev -y
sudo apt-get install libmpc-dev -y
sudo apt-get install texinfo -y
sudo apt-get install libcloog-isl-dev -y

mkdir build-binutils
cd build-binutils
../binutils-2.34/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror 
make
sudo make install

cd ../
mkdir build-gcc
cd build-gcc
../gcc-10.1.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
sudo make install-gcc
sudo make install-target-libgcc

cd
echo "export PATH=\"$PREFIX/bin:\$PATH\"" >> .bashrc
SCRIPT

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/precise32"
    config.vm.provision "shell", inline: $startscript
    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2	
    end
end
