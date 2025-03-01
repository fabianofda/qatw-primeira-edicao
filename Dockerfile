FROM mcr.microsoft.com/playwright:v1.50.1-noble

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    openjdk-21-jdk \
    && apt-get clean

RUN ls /usr/lib/jvm/ # Verificar se o diretório existe

ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Verificar a variável JAVA_HOME
RUN echo $JAVA_HOME
