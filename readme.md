# php7-apache-laravel
Docker image for Laravel 5.6.x

## Packages
  - php7.2 
  - php7.2-mysql 
  - php7.2-mbstring
  - php7.2-soap 
  - php7.2-cli 
  - php7.2-dev 
  - php7.2-ldap 
  - php7.2-gd
  - php7.2-zip 
  - apache2
  - zip 
  - unzip
  - composer
  
## Instruction
To use this image in your project, you need to mount following directories.
  - /app
  - /config
  - /routes
  - /resources
  - /public
 
 Command to build:  
 `docker build --compress docker build --compress --tag tuvshuud/php7-apache-laravel:latest .`
 
 Command to run:  
```bash
docker run -p 8000:80 -v <your_project>/public:/var/www/html/public \
  -v <your_project>/app:/var/www/html/app \
  -v <your_project>/routes:/var/www/html/routes \
  -v <your_project>/resources:/var/www/html/resources \
  -v <your_project>/config:/var/www/html/config \
  --name <container_name> tuvshuud/github
```

To extend this image for your project by adding custom dependency and libraries, see the [example](https://github.com/tuvshuud/php7-apache-laravel/tree/master/example).

Note: This image uses mirror.datacenter.mn as mirror ubuntu repository. You may need to comment out following line in a [Dockerfile](https://github.com/tuvshuud/php7-apache-laravel/blob/master/Dockerfile) to use the default one.  
`RUN sed -i s/archive.ubuntu.com/mirror.datacenter.mn/i /etc/apt/sources.list`
