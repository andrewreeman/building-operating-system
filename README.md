First, ensure that vagrant is running that has the build system in place.
`vagrant up` will launch the vagrant box
Run `vagrant ssh` to ssh into the vagrant machine.
Then navigate to /vagrant
Run `make` to create the os image. Then run `run.sh` to run QEMU using this image`
