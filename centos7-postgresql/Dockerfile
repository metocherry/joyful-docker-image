FROM metocherry/centos7-base:latest

ENV POSTGRESQL_USERNAME postgres
ENV POSTGRESQL_PASSWORD postgres
ENV POSTGRESQL_DATABASE sample

# ${변수:-값}으로 값을 기본값으로 표현 가능
# echo "argument = ${POSTGRESQL_PASSWORD:-postgres}"

# RUN echo "envirment = ${POSTGRESQL_USERNAME}" \
#   && echo "argument = ${POSTGRESQL_PASSWORD}"

# RUN echo "NAME = ${POSTGRESQL_USERNAME}"

RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN dnf install -y postgresql12 postgresql12-server
RUN /usr/pgsql-12/bin/postgresql-12-setup initdb
RUN systemctl start postgresql-12
RUN systemctl status postgresql-12

RUN su - postgres
RUN psql -c "alter user postgres with password 'postgres'"

RUN systemctl restart postgresql-12

# COPY bootstrap.sh /tmp/
CMD echo "NAME = ${POSTGRESQL_USERNAME}"



