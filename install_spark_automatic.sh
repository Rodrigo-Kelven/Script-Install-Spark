#!/bin/bash

# Atualização do sistema
echo "=== Atualizando o sistema ==="
apt update && apt upgrade -y

# Função para verificar a versão do Java
check_java_version() {
    if command -v java &> /dev/null; then
        JAVA_VERSION=$(java -version 2>&1 | head -n 1 | cut -d '"' -f 2)
        echo "Versão do Java instalada: $JAVA_VERSION"
        if [[ "$JAVA_VERSION" == 17* ]]; then
            echo "Java 17 está instalado corretamente."
            return 0
        elif [[ "$JAVA_VERSION" == 11* ]]; then
            echo "Java 11 está instalado, mas Spark 4.0.1 requer Java 17. Atualizando..."
            return 1
        else
            echo "Versão do Java incompatível. Atualizando para Java 17..."
            return 1
        fi
    else
        echo "Java não encontrado. Instalando Java 17..."
        return 1
    fi
}

# Instalar o OpenJDK 17 se necessário
install_java() {
    echo "=== Instalando OpenJDK 17 ==="
    apt install -y openjdk-17-jdk

    # Configurar JAVA_HOME e PATH
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
    export PATH=$JAVA_HOME/bin:$PATH

    # Adicionar as variáveis de ambiente ao .bashrc para persistência
    echo "export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64" >> ~/.bashrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
    source ~/.bashrc

    echo "Java 17 instalado e configurado."
}

# Verificar versão do Java e instalar se necessário
check_java_version || install_java

# Baixar e instalar o Apache Spark
SPARK_VERSION="4.0.1"
HADOOP_VERSION="3"
FILE="spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz"
URL="https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/${FILE}"

echo "=== Baixando Apache Spark ${SPARK_VERSION} com Hadoop ${HADOOP_VERSION} ==="
wget ${URL} -P /tmp

echo "=== Extraindo Spark ==="
tar -xvzf /tmp/${FILE} -C /opt/spark

# Definir variáveis de ambiente para Spark
echo "=== Configurando variáveis de ambiente para o Spark ==="
echo "export SPARK_HOME=/opt/spark/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}" >> ~/.bashrc
echo "export PATH=\$PATH:\$SPARK_HOME/bin:\$SPARK_HOME/sbin" >> ~/.bashrc
source ~/.bashrc

# Verificando instalação do Spark
echo "=== Verificando instalação do Spark ==="
which spark-shell

# Testando se o spark-shell está disponível
echo "=== Testando spark-shell ==="
spark-shell <<EOF
println("===== Spark ${SPARK_VERSION} instalado e funcionando! =====")
:quit
EOF

echo "=== Instalação concluída com sucesso! ==="
