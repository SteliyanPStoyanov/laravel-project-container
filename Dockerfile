ARG LINUX_USER=your_linux_username

FROM php:8.0-apache
USER root
WORKDIR /var/www/html

RUN apt update && apt install -y \
        nano \
        git \
        vim \
        npm \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        zip \
        curl \
        unzip \
        zsh \
        wget \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install exif \
    && docker-php-ext-install zip \
    && docker-php-ext-enable gd pdo_mysql mysqli exif zip\
    && docker-php-source delete

RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends --quiet \
    build-essential \
    libmagickwand-dev \
 && apt-get clean all

RUN pecl install imagick \
 && docker-php-ext-enable imagick

RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends --quiet \
    ghostscript \
 && apt-get clean all

COPY /apache/default.conf /etc/apache2/sites-available/000-default.conf

RUN npm install -g npm@latest
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN groupadd --force -g 1000 ${LINUX_USER}
RUN useradd -ms /bin/bash --no-user-group -g 1000 -u 1000 ${LINUX_USER}
RUN chown -R ${LINUX_USER}:${LINUX_USER} /var/www/html && a2enmod rewrite

# Terminal colors with xterm
ENV TERM xterm

# Set the zsh theme
ENV ZSH_THEME agnoster

# Run the installation script
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
