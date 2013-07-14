# Estrutura do projeto #

O projeto é divido em subprojetos organizados na seguinte estrutura de diretórios:

* mobile/
    * android/ - Aplicativo Android
    * ios/ - Aplicativo iOS
* server/
    * web/ - Aplicativo web para comunicação entre servidor e aplicativos móveis e upload de conteúdo
    * core/ - Implementação dos métodos de busca de imagens

# Servidor #

Para se ter um ambiente de desenvolvimento unificado, é utilizada uma máquina virtual com Ubuntu 12.04 LTS 64-bit e todas as dependências do projeto. Para isso é necessário instalar o [Virtualbox][] e [Vagrant][]. Em seguida executar o seguinte comando dentro do diretório `/server`:
[Virtualbox]:https://www.virtualbox.org/
[Vagrant]:http://www.vagrantup.com/

    vagrant up
    
Para acessar o terminal desta máquina virtual é usado o comando:

    vagrant ssh

## Web ##

Servidor em [Python][] usando framework [Django][].
[Python]:http://www.python.org/
[Django]:https://www.djangoproject.com/

### Roadmap ###

O desenvolvimento do servidor web seguirá o seguinte roadmap:

* Versão 0.1:
    * Receber imagem via HTTP POST e salvá-la em um diretório temporário
    * Executar o programa core para fazer o _matching_ desta imagem com todas imagem de um diretório
    * Retornar o resultado do matching
* Versão 0.2:
    * Executar o programa core para calcular os _feature vectors_ das imagens do banco quando é feito um novo upload (assincronamente)
* Versão 0.3:
    * Interface para gerenciar o banco de imagens e seus vídeos associados
* Versão 0.4:
    * Criar sistema de usuários para que múltiplos usuários possam usar a plataforma independentemente
* Versão 0.5:
    * Tornar a plataforma escalável com múltiplos servidores paralelos

## Core ##

Implementação do algoritmo SIFT baseado no projeto [OpenSIFT][].
[OpenSIFT]:http://robwhess.github.io/opensift/

### Roadmap ###

O desenvolvimento do core seguirá o seguinte roadmap:

* Versão 0.1:
    * Estender o [OpenSIFT][] para que faça matching com todas as imagens de um diretório
    * Retornar no stdout o resultado do matching
* Versão 0.2:
    * Fornecer comando para apenas gerar _feature vectors_ de uma imagem
    * Fazer o matching com _feature vectors_ precalculados
* Versão 0.3:
    * Manter os _feature vectors_ carregados na memória para tornar o matching mais rápido
* Versao 0.4:
    * Calcular e retornar posição da imagem identificada
* Versão 0.5:
    * Desenvolver ferramenta de benchmark para calibrar os parâmetros do método para maior velocidade com taxa de erro tolerável
    * Calibrar os parâmetros do método
* Versão 0.6:
    * Implementar [Scalable Recognition with a Vocabulary Tree][] para tornar a busca escalável para grandes bancos de imagens

[Scalable Recognition with a Vocabulary Tree]:http://ieeexplore.ieee.org/xpl/articleDetails.jsp?reload=true&arnumber=1641018

# Aplicativos Móveis #

Aplicativos para plataformas _Android_ e _iOS_.

### Roadmap ###

O desenvolvimento dos aplicativos seguirá o seguinte roadmap:

* Versão 0.1:
    * Exibir na tela as imagens capturadas pela câmera do dispositivo em tempo real
    * Enviar um frame a cada 5 segundos para o servidor via HTTP POST
    * Exibir na tela a resposta do servidor
* Versão 0.2:
    * Calcular os _feature vectors_ dos frames e enviá-los ao invés da imagem
    * Enviar dados para o servidor apenas quando for relevante
* Versão 0.3:
    * Fazer download de vídeo informado na resposta do servidor e exibí-lo em fullscreen
* Versão 0.4:
    * Desenhar polígono sobre a região da imagem que foi identificada
* Versão 0.5:
    * Tracking da região identificada
    * Atualizar desenho do polígono de acordo com o tracking
* Versão 0.6:
    * Exibir vídeo sobre a região identificada
* Versão 0.7:
    * Implementar reconhecimento de imagem local para evitar usar o servidor para identificar uma mesma imagem pela segunda vez
* Versão 0.8:
    * Streaming do vídeo
* Versão 0.9:
    * Extrair um SDK do aplicativo