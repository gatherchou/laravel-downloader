FROM ubuntu

RUN apt-get update

#install php5 curl git
RUN apt-get install -y php5 curl git

#install composer
RUN curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

#install laravel
RUN composer global require "laravel/installer=~1.1"
RUN ln -s /root/.composer/vendor/laravel/installer/laravel /usr/local/bin/

RUN mkdir /data
VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["laravel","new"]
CMD ["--help"]
