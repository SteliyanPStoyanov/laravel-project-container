# Docker Project Container with PHP 8+ and Apache

[![CircleCI](https://circleci.com/gh/adrian-gheorghe/docker-setup.svg?style=svg)](https://circleci.com/gh/adrian-gheorghe/docker-setup)

## Dockerfile 

This file containes all the php extension and configurations.

## Project Container Commands 

**Build container commands:**

```bash
bin/build
```

**Start all container commands:**

```bash
bin/start
```

**Stop all container commands:**

```bash
bin/stop
```

## Project Folder Location

Laravel project must be in `src` folder by default. You can change it from `docker-composer.yml` file.

## Enter In Project Container

```bash
bin/shell
```

## Registering The SSL Certificates

You must to run command from `WebServer` directory and must include all the apps, because they use one certificate.

```
mkcert -cert-file ./docker_files/cert -key-file ./docker_files/cert-key portainer.localhost traefik.localhost 
```

Then you need to add all the apps addresses `app1.localhost`, `app2.localhost`, etc.

```
mkcert -cert-file ./docker_files/cert -key-file ./docker_files/cert-key portainer.localhost traefik.localhost  app1.localhost app2.localhost
```