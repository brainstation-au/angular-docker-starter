FROM node:8
LABEL au.com.brainstation.project="__PROJECT_NAME__"
WORKDIR /usr/src/app

ENV BIN_DIR=/usr/src/bin
ENV PHANTOMJS_VERSION=2.1.1
ENV NODE_SASS_VERSION=4.8.3
ENV PHANTOMJS_NAME=phantomjs-$PHANTOMJS_VERSION-linux-x86_64
ENV PHANTOMJS_FILENAME=$PHANTOMJS_NAME.tar.bz2
ENV NODE_SASS_FILENAME=linux-x64-51_binding.node
ENV SASS_BINARY_PATH=$BIN_DIR/$NODE_SASS_FILENAME
ENV PATH=$PATH:$BIN_DIR/$PHANTOMJS_NAME/bin

RUN yarn global add @angular/cli
RUN mkdir -p ${BIN_DIR} && cd ${BIN_DIR} && \
  wget https://github.com/Medium/phantomjs/releases/download/v${PHANTOMJS_VERSION}/${PHANTOMJS_FILENAME} && \
  tar -xjf ${PHANTOMJS_FILENAME} && \
  wget https://github.com/sass/node-sass/releases/download/v${NODE_SASS_VERSION}/${NODE_SASS_FILENAME}

# Angular port.
EXPOSE __ANGULAR_PORT__

# Karma port.
EXPOSE __KARMA_PORT__
