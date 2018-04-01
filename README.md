# angular-docker-starter
An Angular project starter with dockerized development environment

- Clone this repository.
- Set variables in `.env` file.
- Add the host name in `/etc/hosts` that you set for `LOCAL_HOST` variable in `.env` file,
For example: `127.0.0.1	localhost brainstation.dev`.
- Run `brainstation.sh`.

We will get a new directory with the name set for `PROJECT_NAME` variable in `.env` file.

Browse in that directory `cd {PROJECT_NAME}` and then run `docker-compose up -d`. This will create required containers.
Once the containers are ready, docker will run your client in detached mode.
To see the logs run `docker-compose logs -f`.

Once the compilation is done, you can browse the fresh Angular APP at your hostname. eg. `http://brainstation.dev:4200`.

You can run test with `docker-compose exec client yarn test` and connect your browser at `http://localhost:9876`.