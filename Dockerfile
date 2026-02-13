<<<<<<< HEAD
FROM nginx
COPY index.html /usr/share/nginx/html/index.html

=======
FROM nginx:latest

COPY . /usr/share/nginx/html

EXPOSE 80
>>>>>>> 55e019b4d620cd7bb772825281ab241b9363af88
