# Base image
FROM ubuntu:18.04

# Installing dependencies
ENV LANG C.UTF-8
RUN apt-get update --fix-missing
RUN apt-get install -y ffmpeg
RUN apt-get install -y python
RUN apt-get install -y python-dev
RUN apt-get install -y python-pip
RUN apt-get install -y libssl-dev
RUN apt-get install -y libpq-dev
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y libfontconfig1
RUN apt-get install -y libfontconfig1-dev
RUN apt-get install -y curl
# RUN apt-get install -y libmysqlclient-dev
# RUN apt-get install -y redis-server
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs
RUN pip install --upgrade pip

# Copy and install everything from the requirements file
COPY ./requirements.txt ./requirements.txt
RUN (cat requirements.txt | xargs -n 1 pip install || true) && rm ./requirements.txt

# COPY . /root
COPY ./ /root
WORKDIR /root

# Install dev tools
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
RUN apt-get install -y nano

# Exposed ports
EXPOSE 8000

# Starting my dev environment
RUN bash
