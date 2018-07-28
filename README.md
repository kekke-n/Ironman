# Daredevil

Daredevil is a web application that makes it easy to see data in the database by registering SQL.

![Daredevil](https://orig00.deviantart.net/3248/f/2008/143/b/b/daredevil_by_jebriodo.jpg)


## Version

- Ruby 2.5.0
- Rails 5.1.5

## How to build a development environment

- Download daredevil code

```
git clone https://github.com/adebadayo/Daredevil.git
```

- Execute the following docker-compose command.

```
docker-compose build
docker-compose run web bin/rake db:create db:migrate db:seed
docker-compose up
```

## How to debug
- Put down `byebug` or `debugger` where your want to debug.
- Execute the following docker command.
```
docker attach web_container_name
```
  - You can watch the console display.
- If you want to know web_container_name, you can confirm from `docker ps`
- If you want to exit from debugger console, please command `Control + P, Q` , not `Control + C`.
  - `Control + C` make container stopped.
