FROM docker.io/apache/age:release_PG18_1.8.0

ENV PG_CONFIG=/usr/lib/postgresql/${PG_MAJOR}/bin/pg_config

RUN apt-get update
RUN apt-get install -y build-essential git postgresql-server-dev-${PG_MAJOR}
RUN git clone --branch v0.8.6 https://github.com/pgvector/pgvector.git
RUN (cd pgvector && make -j$(nproc) && make install)
