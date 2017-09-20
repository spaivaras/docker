## ESP32 toolchain and esp-idf image

### Info
This is an image of with built in xtensa compilers and esp-idf by Espressif. Used for proper esp32 building not that arduino environment garbage.

Image: https://hub.docker.com/r/a1waras/esp32/

### Usage
I have included docker-compose.yml-example that you can use in your project. It manages volumes and other options needed (basically forwarding serial converter from host to docker container)
__NOTE__ make sure you have an available /dev/ttyUSB0 device before starting up this image, or edit docker-compose.yml file for your needs.
```
$ docker-compose run dev
```
This will launch the container, mount the current path to __/home/project/src__ and you are good to go

If you have no experience with docker, or with some brain damage you plan to use "native" osx/windows solutions for docker, I strongly recommend to use [.NFQ vagrant box for docker (debian-stretch/virtual-box)](https://app.vagrantup.com/nfqlt/boxes/docker)


### Building
Personally I use [.NFQ vagrant box for docker (debian-stretch/virtual-box)](https://app.vagrantup.com/nfqlt/boxes/docker) for building this image.

```shell
$ vagrant ssh
$ cd ~/images
$ mkdir my_docker_io_username
$ cd my_docker_io_username
$ git clone git@github.com:spaivaras/docker.git .
$ cd esp32
$ make build 
```

If you plan to use native docker on linux environment, then you'll need tools and makefiles i depend on from [.NFQ docker images](https://github.com/nfq-technologies/docker-images)

```shell
$ cd /tmp
$ git clone git@github.com:nfq-technologies/docker-images.git nfqlt
$ git clone git@github.com:spaivaras/docker.git my_docker_io_username
$ cd my_docker_io_username/esp32
$ make build
```

