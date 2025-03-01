FROM mcr.microsoft.com/playwright:v1.50.1-noble

# Atualizar os pacotes e instalar o OpenJDK
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    openjdk-21-jdk \
    && apt-get clean

# Verificar se o Java foi instalado corretamente
RUN ls /usr/lib/jvm/

# Definir JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"
