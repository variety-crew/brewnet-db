# MariaDB Dockerfile (mariadb/Dockerfile)
FROM mariadb:10.6

# Set environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=
ENV MYSQL_DATABASE=
ENV MYSQL_USER=
ENV MYSQL_PASSWORD=

# Copy the custom initialization scripts
COPY 01-create-user.sql /docker-entrypoint-initdb.d/
COPY 02-create-tables.sql /docker-entrypoint-initdb.d/
COPY 03-insert-dummy-data.sql /docker-entrypoint-initdb.d/

# Expose port 3306 to connect MariaDB
EXPOSE 3306
