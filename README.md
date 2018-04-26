# angular-docker-starter
This is **not** an Angular project. It's a package of few scripts that creates a fresh new latest Angular project 
with @angular/cli and configure the project to start development in a Docker container.

The objective of this project is to automate the setup process of new Angular project.

## How to use?

Following instructions are based on default values in the **.env** file.
```text
PROJECT_NAME=brainstation
LOCAL_HOST=brainstation.test
ANGULAR_PORT=4200
KARMA_PORT=9876
BOOTSTRAP=TRUE
MATERIAL=FALSE
DOMAIN=brainstation.com.au
```

Add the host name in **/etc/hosts** that is set for **LOCAL_HOST** variable in **.env** file.
```text
127.0.0.1	localhost brainstation.test
```

You can choose styleguides between [Bootstrap](http://getbootstrap.com/) and [Material](https://material.angular.io/).

Clone the repository and get started.
```bash
$ git clone https://github.com/brainstation-au/angular-docker-starter
$ cd angular-docker-starter
$ ./brainstation.sh
```

At this point we should have got a new folder named **brainstation** in the parent directory. 
This is the folder that has your new Angular project.

## How is the new project?
```bash
$ cd ../brainstation
$ docker-compose up -d
$ docker-compose logs -f
```
At this point you will be watching logs. You can see **yarn** installs all the project dependencies and then Angular
CLI compiles the project. You can now browse your fresh project at **http://brainstation.dev:4200/**.

You can run tests.
```bash
$ docker-compose exec client yarn test
```
You can see Angular CLI compiles the test modules and spec files. You can connect your browser 
at **http://localhost:9876/**. 
