# Docker Environment Local for Laravel 8 and PHP8.0 apache

[![CircleCI](https://circleci.com/gh/adrian-gheorghe/docker-setup.svg?style=svg)](https://circleci.com/gh/adrian-gheorghe/docker-setup)

## Dockerfile 

All php extension and configs

## Project container commands 

Build container commands
```bash
bin/build
```

Start all container commands
```bash
bin/start
```

Stop all container commands
```bash
bin/stop
```

## Project folder location

Laravel project must be in src folder by default. 
You can change it from docker-composer.yml


## To enter in project container

```bash
bin/shell
```