export PATH_TO_CS128_DIR=$"$(pwd)" # this should be root cs128env
echo "Path to cs128env folder: $PATH_TO_CS128_DIR"
if [[ `uname -m` == 'arm64' ]]; then
  docker pull michaelrnowak/cpp-dev-env:m1-latest
  docker run -d -v "$PATH_TO_CS128_DIR/src:/home/vagrant/src" -v "$PATH_TO_CS128_DIR/.shared:/home/vagrant/.shared" -p 2222:22 --security-opt seccomp=unconfined --name cs128env michaelrnowak/cpp-dev-env:latest-m1
else
  docker pull michaelrnowak/cpp-dev-env:latest
  docker run -d -v "$PATH_TO_CS128_DIR/src:/home/vagrant/src" -v "$PATH_TO_CS128_DIR/.shared:/home/vagrant/.shared" -p 2222:22 --security-opt seccomp=unconfined --name cs128env michaelrnowak/cpp-dev-env:latest
fi

