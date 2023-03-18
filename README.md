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

## SSL

Must be run command from webserver dir and must include all app .
They use one cert for example
```
mkcert -cert-file ./docker_files/cert -key-file ./docker_files/cert-key portainer.localhost traefik.localhost 
```
and then you add all app address app1.localhost app2.localhost 

```
mkcert -cert-file ./docker_files/cert -key-file ./docker_files/cert-key portainer.localhost traefik.localhost  app1.localhost app2.localhost
```