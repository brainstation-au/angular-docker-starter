FROM node:10.16
LABEL {{DOMAIN}}="{{PROJECT_NAME}}"
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

#Install node-sass.
ENV NODE_SASS_VERSION=4.9.3
ENV NODE_SASS_FILENAME=linux-x64-64_binding.node
ENV SASS_BINARY_PATH=$BIN_DIR/$NODE_SASS_FILENAME
RUN cd ${BIN_DIR} && \
  wget https://github.com/sass/node-sass/releases/download/v${NODE_SASS_VERSION}/${NODE_SASS_FILENAME}

# Install angular-cli.
RUN npm i -g @angular/cli@8.0.2

# Angular port.
EXPOSE {{ANGULAR_PORT}}

# Karma port.
EXPOSE {{KARMA_PORT}}
