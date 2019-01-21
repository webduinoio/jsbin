FROM node:boron
WORKDIR /src
ADD . /src

RUN apt-get update \
    && echo 'Y' | apt-get install libtool pkg-config build-essential autoconf automake libzmq3-dev \
    && npm install \
    && npm install -g grunt-cli \
    && grunt build

EXPOSE 80

CMD ["npm", "start"]
