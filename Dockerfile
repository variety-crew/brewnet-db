# MariaDB Dockerfile (mariadb/Dockerfile)
FROM mariadb:10.6

# Define build arguments
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

# Set environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Copy the custom initialization scripts
COPY 01-create-user.sql /docker-entrypoint-initdb.d/
COPY 02-create-tables.sql /docker-entrypoint-initdb.d/
COPY 03-insert-dummy-data.sql /docker-entrypoint-initdb.d/

# Expose port 3306 to connect MariaDB
EXPOSE 3306
