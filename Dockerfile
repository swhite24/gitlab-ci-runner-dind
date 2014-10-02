# gitlab-ci-runner

from        ubuntu:14.04
maintainer  swhite24 "swhitewvu24@gmail.com"

# Let's start with some basic stuff.
RUN apt-get update -qqy
RUN apt-get install -qqy iptables ca-certificates lxc

# Install Docker from Docker Inc. repositories.
RUN apt-get install -qqy apt-transport-https
RUN echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN apt-get update -qq
RUN apt-get install -qqy lxc-docker

# Install ruby deps
RUN apt-get install -y curl libxml2-dev libxslt-dev libcurl4-openssl-dev libreadline6-dev libssl-dev patch build-essential zlib1g-dev openssh-server libyaml-dev libicu-dev

# Download Ruby and compile it
RUN mkdir /tmp/ruby
RUN cd /tmp/ruby && curl --silent ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz | tar xz
RUN cd /tmp/ruby/ruby-2.0.0-p481 && ./configure --disable-install-rdoc && make install

# Install bundler
RUN gem install bundler

# Set a utf-8 locale
RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale
RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8

# Prepare a known host file for non-interactive ssh connections
RUN mkdir -p /root/.ssh
RUN touch /root/.ssh/known_hosts

# Install the runner
RUN git clone https://github.com/gitlabhq/gitlab-ci-runner.git /gitlab-ci-runner

# Install the gems for the runner
RUN cd /gitlab-ci-runner && bundle install
