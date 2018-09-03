# php7-apache-laravel
Docker image source for Laravel 5.6.x

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

To extend this image for your project by adding custom dependency and libraries, see the [example](https://github.com/tuvshuud/php7-apache-laravel/example).
