# final

# base image
FROM nginx:1.15.0-alpine

# copy static files
COPY ./app/build /usr/share/nginx/html
COPY ./app/build /var/www/html

# expose port
EXPOSE 80

# run nginx
CMD ["nginx", "-g", "daemon off;"]
