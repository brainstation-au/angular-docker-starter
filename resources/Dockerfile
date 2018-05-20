FROM node:8.11.2
LABEL __DOMAIN__="__PROJECT_NAME__"
WORKDIR /usr/src/app

RUN npm i -g @angular/cli@~6.0.3

ENV BIN_DIR=/usr/src/bin
RUN mkdir -p ${BIN_DIR}

ENV PHANTOMJS_VERSION=2.1.1
ENV PHANTOMJS_NAME=phantomjs-$PHANTOMJS_VERSION-linux-x86_64
ENV PHANTOMJS_FILENAME=$PHANTOMJS_NAME.tar.bz2
RUN cd ${BIN_DIR} && \
  wget https://github.com/Medium/phantomjs/releases/download/v${PHANTOMJS_VERSION}/${PHANTOMJS_FILENAME} && \
  tar -xjf ${PHANTOMJS_FILENAME}
ENV PATH=$PATH:$BIN_DIR/$PHANTOMJS_NAME/bin

ENV NODE_SASS_VERSION=4.9.0
ENV NODE_SASS_FILENAME=linux-x64-57_binding.node
ENV SASS_BINARY_PATH=$BIN_DIR/$NODE_SASS_FILENAME
RUN cd ${BIN_DIR} && \
  wget https://github.com/sass/node-sass/releases/download/v${NODE_SASS_VERSION}/${NODE_SASS_FILENAME}

# Angular port.
EXPOSE __ANGULAR_PORT__

# Karma port.
EXPOSE __KARMA_PORT__
