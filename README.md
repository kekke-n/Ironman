# Daredevil

Daredevil is a web application that makes it easy to see data in the database by registering SQL.

![Daredevil](https://orig00.deviantart.net/3248/f/2008/143/b/b/daredevil_by_jebriodo.jpg)


## How to build a development environment

- Ruby 2.5.0
- Rails 5.1.5

Execute the following docker command.

```
docker-compose build
docker-compose run web bin/rake db:create db:migrate db:seed
docker-compose up
```
