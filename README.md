# docker-compose-laravel

A LEMP network of containers for local Laravel development.

## Usage

In the rool of this project directory bring up the LEMP network of containers by issuing the following command in you terminal: `docker-compose up -d --build site`.

After that completes, follow the steps from the [src/README.md](/src/README.md) file to get your Laravel project added in (or create a new blank one).

Bringing up the Docker Compose network with site instead of just using up, ensures that only our site's containers are brought up at the start, instead of all of the command containers as well. The following are built for our web server, with their exposed ports detailed:

* nginx: `8080`
* mysql: `3306`
* php: `9000`

Three additional containers are included that handle Composer, NPM, and Artisan commands without having to have these platforms installed on your local computer. Use the following command examples from your project root, modifying them to fit your particular use case.

* `docker-compose run --rm composer update`
* `docker-compose run --rm npm run dev`
* `docker-compose run --rm artisan migrate`

## Persistent MySQL Storage

By default, whenever you bring down the Docker network, your MySQL data will be removed after the containers are destroyed. If you would like to have persistent data that remains after bringing containers down and back up, do the following:

1. Create a `mysql` folder in the project root, alongside the `nginx` and `src` folders.
2. Under the mysql service in your docker-compose.yml file, add the following lines:

```
volumes:
  - ./mysql:/var/lib/mysql
```