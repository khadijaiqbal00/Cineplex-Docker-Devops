FROM mysql:5.7

# Copy the database dump file to the container
#COPY dump.sql /docker-entrypoint-initdb.d/



ENV MYSQL_DATABASE=laradb
ENV MYSQL_USER=laradb
ENV MYSQL_PASSWORD=secret
ENV MYSQL_ROOT_PASSWORD=secret

