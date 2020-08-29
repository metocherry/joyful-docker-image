#!/usr/bin/env bash

## https://computingforgeeks.com/how-to-install-postgresql-12-on-centos-7/
## https://judo0179.tistory.com/48

## The PostgreSQL Yum Repository will integrate with your normal systems and patch management,
## and provide automatic updates for all supported versions of PostgreSQL throughout the support lifetime of PostgreSQL.
## You can get more information on installed package by running the command
## rpm -qi pgdg-redhat-repo
yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

dnf -y install postgresql12 postgresql12-server

/usr/pgsql-12/bin/postgresql-12-setup initdb

systemctl enable --now postgresql-12
systemctl status postgresql-12

su - postgres
psql -c "alter user postgres with password 'postgres'"

vi /var/lib/pgsql/12/data/pg_hba.conf
# TYPE  DATABASE        USER            ADDRESS                 METHOD
# local   all           postgres                                md5
# host    all           postgres        0.0.0.0/0               md5
# host    all           postgres        ::/0                    md5

systemctl restart postgresql-12

# psql -U <dbuser> -h <serverip> -p 5432 <dbname>
psql -U postgres

