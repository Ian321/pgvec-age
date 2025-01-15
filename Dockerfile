FROM apache/age:release_PG16_1.5.0

RUN apt-get update
RUN apt-get install -y git
RUN git clone --branch v0.8.0 https://github.com/pgvector/pgvector.git
RUN (cd pgvector && make -j$(nproc) && make install)
