./buildBootSector.sh
./buildKernel.sh
cat boot_sector.bin kernel.bin > os-image
