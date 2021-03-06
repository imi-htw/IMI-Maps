**Travis CI**
[![Build Status](https://travis-ci.org/imimaps/imimaps.svg?branch=master)](https://travis-ci.org/imimaps/imimaps)

The [IMI Map](http://imi-map.f4.htw-berlin.de) supports students at the University of Applied Sciences Berlin in finding an internship abroad.

The project was developed as part of the study of international media and computer sience.

## Development Setup
Zum lokalen entwickeln muss folgende Software installiert werden:
- [VirtualBox](https://www.virtualbox.org/)
- [Docker](https://www.docker.com/)
- [Homebrew](http://brew.sh/)

```
# Install Dependencies
$ brew update && brew install docker-machine imagemagick@6 node openssl rbenv \
  ruby-build unison postgresql

$ brew link --force imagemagick@6
$ curl "https://raw.githubusercontent.com/hnsl/unox/master/unox.py" -o "/usr/local/bin/unison-fsmonitor" && chmod +x /usr/local/bin/unison-fsmonitor
$ sudo easy_install pip && sudo pip install watchdog macfsevents



# Create a virtual machine running the Docker engine
$ docker-machine create -d virtualbox development
$ eval $(docker-machine env development)

# Install imimaps ruby
$ cd /path/to/imimaps
$ rbenv install 2.1.5
$ rbenv global 2.1.5 (optional, if you want to set 2.1.5 as your default Ruby version)
$ echo 'eval "$(rbenv init -)"' >> ~/.bashrc
$ source ~/.bashrc
$ gem install docker-sync thor

# Build the development environment
$ ./docker-tool development build

# start the development environment
$ ./docker-tool development start

# Open the application in your browser (run this in a new shell)
$ eval $(docker-machine env development)
$ open http://$(docker-machine ip development)

