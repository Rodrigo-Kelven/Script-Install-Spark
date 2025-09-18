# Instalação Automática do Apache Spark com Java 17

#### Este script realiza a instalação automática do Apache Spark 4.0.1 com Hadoop 3, juntamente com a instalação ou atualização do Java 17, se necessário. O objetivo é garantir que o Spark e o Java estejam corretamente configurados para a execução de tarefas distribuídas e interativas.

## Requisitos

- #### Sistema Operacional: Ubuntu (ou outras distribuições baseadas no Debian).

- #### Permissões: O script precisa de permissões de root para instalar pacotes e modificar variáveis de ambiente.

## Funcionalidade do Script

- ### 1. Verificação da versão do Java:

    - #### O script começa verificando se o Java já está instalado no sistema e qual a versão.

    - #### Se o Java 17 não estiver instalado ou se a versão instalada for Java 11 ou inferior, o script irá atualizar para Java 17.

- ### 2. Instalação do Java:

    - #### Caso o Java 17 não esteja instalado, o script realiza a instalação automática do OpenJDK 17.

    - #### As variáveis de ambiente para o Java (JAVA_HOME e PATH) são configuradas corretamente, tanto no sistema como no arquivo de configuração (.bashrc).

- ### 3. Instalação do Apache Spark:

    - #### O script faz o download do Apache Spark versão 4.0.1 com suporte ao Hadoop 3 diretamente do repositório oficial do Apache.

    - #### Após o download, o Spark é extraído na pasta /opt/spark.

- ### 4. Configuração do Spark:

    - #### O script configura as variáveis de ambiente do Spark (SPARK_HOME e PATH) para garantir que o Spark possa ser executado globalmente a partir de qualquer terminal.

- ### 5. Testes pós-instalação:

    - #### O script tenta rodar o comando spark-shell para verificar se a instalação foi bem-sucedida e se o Spark está funcionando corretamente.

---
## Instruções de Uso
- ### 1. Baixe o Script

#### Primeiro, baixe ou crie o arquivo install_spark_automatic.sh com o conteúdo fornecido no repositório.
         git clone https://github.com/Rodrigo-Kelven/Script-Install-Spark

#### 2. Dê Permissão para Executar o Script
        chmod +x install_spark_automatic.sh

#### 3. Execute o Script
        ./install_spark_automatic.sh

### Exemplo de Saída Esperada

#### Durante a execução do script, você verá mensagens de log semelhantes a estas:
            === Atualizando o sistema ===
            ...
            === Instalando OpenJDK 17 ===
            ...
            === Baixando Apache Spark 4.0.1 com Hadoop 3 ===
            ...
            === Verificando instalação do Spark ===
            /opt/spark/spark-4.0.1-bin-hadoop3/bin/spark-shell
            === Testando spark-shell ===
            ===== Spark 4.0.1 instalado e funcionando! =====

**Se tudo ocorrer corretamente, a instalação do Apache Spark será concluída com sucesso e o spark-shell estará funcionando.**


## O que é o Apache Spark?

O Apache Spark é uma plataforma de processamento distribuído de dados em grande escala. Ele é projetado para ser rápido e fácil de usar, permitindo que você processe grandes volumes de dados de maneira eficiente. O Spark oferece uma interface de programação que suporta consultas SQL, aprendizado de máquina, processamento de dados em tempo real e processamento em lote, entre outros.

## Sobre o Java 17

A versão Java 17 é uma versão LTS (Long Term Support) que garante estabilidade e segurança para aplicações de longo prazo. O Apache Spark 4.0.1 requer Java 17 para funcionar corretamente, pois foi compilado com essa versão do JDK. Este script garante que a versão correta do Java seja instalada e configurada.

---

## Problemas Comuns e Soluções
### Erro: "command not found: spark-shell"

- #### Isso pode ocorrer se as variáveis de ambiente não estiverem corretamente configuradas. Execute o comando source ~/.bashrc para garantir que as variáveis sejam recarregadas.

- #### Verifique também se o diretório do Spark está no PATH com echo $PATH.

### Erro de versão do Java incompatível

- #### Se o erro persiste, verifique se o JAVA_HOME está apontando para a versão correta do Java com o comando echo $JAVA_HOME.

- #### Tente rodar o comando spark-shell com a variável JAVA_HOME explícita, por exemplo:
            JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64 spark-shell


### Instalação do Java falhou

- #### Certifique-se de que seu sistema está atualizado (apt update).

- #### Se necessário, reinstale o OpenJDK 17 com sudo apt install --reinstall openjdk-17-jdk.


## Conclusão

**Este script permite que você instale e configure o Apache Spark 4.0.1 de forma simples e rápida, garantindo que o ambiente Java esteja corretamente configurado. É recomendado para quem deseja começar a usar o Spark sem se preocupar com as configurações manuais do Java e do Spark.**

**Se tiver problemas ou dúvidas, consulte a documentação do Apache Spark ou entre em contato para assistência adicional.**
