# Ironman

Ironman is a web application that makes it easy to see data in the database by registering SQL.

![Ironman](https://pre00.deviantart.net/4c98/th/pre/i/2011/057/7/3/ironman_by_thestickibear-d3ahlq0.jpg)

https://www.deviantart.com/thestickibear/art/Ironman-199015992?offset=0


## Version

- Ruby 2.5.0
- Rails 5.1.5

## How to build a development environment

- Download Ironman code

```
git clone https://github.com/adebadayo/Ironman.git
```

- Write DB password of your environment to `docker-compose.yml` and `database.yml`
  - docker-compose.yml
```yml
POSTGRES_PASSWORD: # put down your environment password
```
  - database.yml
```yml
  password:  # put down your environment password
```

- Execute the following docker-compose command.
```
docker-compose build
docker-compose run web bin/rake db:create db:migrate db:seed
docker-compose up
```

## How to debug
- Write`byebug` or `debugger` where your want to debug.
- Execute the following docker command.
```
docker attach web_container_name
```
  - You can watch the console display.
- If you want to know web_container_name, you can confirm from `docker ps`
- If you want to exit from debugger console, please command `Control + P, Q` , not `Control + C`.
  - `Control + C` make container stopped.
