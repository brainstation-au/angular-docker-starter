FROM circleci/node:10.13-browsers
LABEL __DOMAIN__="__PROJECT_NAME__"
WORKDIR /usr/src/app

#Install node-sass.
ENV BIN_DIR=/usr/src/bin
ENV NODE_SASS_VERSION=4.9.3
ENV NODE_SASS_FILENAME=linux-x64-64_binding.node
ENV SASS_BINARY_PATH=$BIN_DIR/$NODE_SASS_FILENAME
RUN sudo mkdir -p ${BIN_DIR} && \
  cd ${BIN_DIR} && \
  sudo wget https://github.com/sass/node-sass/releases/download/v${NODE_SASS_VERSION}/${NODE_SASS_FILENAME}

# Install angular-cli.
RUN sudo npm i -g @angular/cli@7.0.4

# Angular port.
EXPOSE __ANGULAR_PORT__

# Karma port.
EXPOSE __KARMA_PORT__
