FROM node:10.12.0
LABEL __DOMAIN__="__PROJECT_NAME__"
WORKDIR /usr/src/app

# Install Google Chrome.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -y google-chrome-stable xvfb

ENV BIN_DIR=/usr/src/bin
RUN mkdir -p ${BIN_DIR}

# Install PhantomJs.
ENV PHANTOMJS_VERSION=2.1.1
ENV PHANTOMJS_NAME=phantomjs-$PHANTOMJS_VERSION-linux-x86_64
ENV PHANTOMJS_FILENAME=$PHANTOMJS_NAME.tar.bz2
RUN cd ${BIN_DIR} && \
  wget https://github.com/Medium/phantomjs/releases/download/v${PHANTOMJS_VERSION}/${PHANTOMJS_FILENAME} && \
  tar -xjf ${PHANTOMJS_FILENAME}
ENV PATH=$PATH:$BIN_DIR/$PHANTOMJS_NAME/bin

#Install node-sass.v4.9.3/darwin-x64-64_binding.node
ENV NODE_SASS_VERSION=4.9.3
ENV NODE_SASS_FILENAME=linux-x64-64_binding.node
ENV SASS_BINARY_PATH=$BIN_DIR/$NODE_SASS_FILENAME
RUN cd ${BIN_DIR} && \
  wget https://github.com/sass/node-sass/releases/download/v${NODE_SASS_VERSION}/${NODE_SASS_FILENAME}

# Install angular-cli.
RUN npm i -g @angular/cli@7.0.2

# Angular port.
EXPOSE __ANGULAR_PORT__

# Karma port.
EXPOSE __KARMA_PORT__
