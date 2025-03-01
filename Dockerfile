FROM mcr.microsoft.com/playwright:v1.50.1-noble

# Atualizar pacotes e instalar wget, unzip e OpenJDK 21
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    openjdk-21-jdk \
    && apt-get clean

# Configurar JAVA_HOME globalmente
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Verificar se a variável JAVA_HOME está configurada corretamente
RUN echo "JAVA_HOME: $JAVA_HOME"
RUN echo "PATH: $PATH"
RUN ls $JAVA_HOME

# Instalar Allure Commandline (opcional, se necessário)
RUN wget -qO- https://dl.bintray.com/qameta/maven/io/qameta/allure/allure-commandline/2.13.8/allure-commandline-2.13.8.tgz | tar -xz -C /opt/
ENV PATH="/opt/allure-2.13.8/bin:${PATH}"

# Verificar instalação do Allure
RUN allure --version
