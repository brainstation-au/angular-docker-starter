# angular-docker-starter
An Angular project starter with dockerized development environment

The objective of this project is to automate the setup process of new Angular project.

## How to use?

Following instructions are based on default values in the **.env** file.
```text
PROJECT_NAME=brainstation
LOCAL_HOST=brainstation.dev
ANGULAR_PORT=4200
KARMA_PORT=9876
```

Clone the repository and get started.
```bash
$ git clone https://github.com/brainstation-au/angular-docker-starter
$ cd angular-docker-starter
$ brainstation.sh
```

At this point we should have got a new folder named **brainstation**. This is the folder that has your new Angular
project. You can how move this directory to somewhere else (out of the parent directory *angular-docker-starter*).
The purpose of this *angular-docker-started* project is now finished and you can delete this folder.

## How is the new project?
```bash
$ cd brainstation
$ docker-compose up -d
$ docker-compose logs -f
```
At this point you will be watching logs. You can see **yarn** installs all the project dependencies and then Angular
CLI compiles the project. You can now browse your fresh project at **http://brainstation.dev:4200/**.

You can run tests.
```bash
$ docker-compose exec client yarn test
```
You can see Angular CLI compiles the test modules and spec files. You connect your browser at **http://localhost:9876/**. 
