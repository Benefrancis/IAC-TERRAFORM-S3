**Infraestrutura como código: Docker e Elastic Beanstalk na AWS**

O estado distribuído é uma maneira que podemos armazenar os arquivos de estado da infraestrutura do Terraform que traz
algumas vantagens para nós.

**O estado fica acessível de vários locais.**
Com o arquivo de estado guardado em um serviço de cloud podemos acessá-lo de qualquer computador, sem precisar ter medo
que ele se perca.

**Facilita a implementação de rotinas de entrega contínua.**
Como a maioria das rotinas de entrega contínua é executada dentro de containers docker, elas não salvam nenhum tipo de
arquivo local, então salvar o estado em um serviço de cloud pode ajudar bastante.

Quando montamos imagens do Docker, sempre colocamos as imagens criadas em repositórios, assim conseguimos ter algumas
vantagens em relação a manter a imagem apenas no nosso computador.

**As imagens ficam disponíveis rapidamente e a qualquer momento.**
Por normalmente estar em um serviço de cloud, não precisamos nos preocupar em montar um servidor para servir as imagens,
disponibilizá-lo publicamente ou colocar um esquema de credenciais. Toda a infraestrutura já está pronta e normalmente
com replicação para evitar downtime (ficar fora do ar).

**Maior velocidade para serviços externos adquirirem a imagem.**
Como a infraestrutura já é feita com um objetivo em mente, ela é otimizada para entregar as imagens o mais rápido
possível, permitindo o deploy mais rápido e ágil da aplicação.

## 🐋 Imagem Docker

```cmd
docker build . -t clientes:v1
```

## 🔨 Funcionalidades do projeto

A partir desse projeto você pode:

- Criar ambientes para aplicações Docker
- Separar o seu codigo em 2 ambientes, um de produção e um de homologação
- Configurar máquinas para executar um container com uma API automaticamente
- Preparar uma infraestrutura elastica

## ✔️ Técnicas e tecnologias utilizadas

Neste App são exploradas as seguintes técnicas e tecnologias:

- **Criação de maquinas para executar containers Docker**: criação de maquinas virtuias no ambiente EC2 (Elastic Compute
  Cloud) da AWS feito de forma automatica pelo Elastic Beanstalk
- **Criação de imagens Docker**: criação das imagens a serem utilizadas pelo Docker
- **Elastic Constainer Registry**: o repositorio de containers da AWS, onde vamos colocar as nossas imagens.
- **Separação de ambientes**: 2 ambientes separados, construidos de forma automatica pelo Terraform, reultilizando
  codigo.

## 🛠️ Abrir e rodar o projeto

O projeto foi desenvolvido no VSC (Visual Studio Code), sendo assim, instale o VSC (pode ser uma versão mais recente) e,
na tela inicial, procure a opção extenções, ou aperte Ctrl+Shift+X, e busque por HashiCorp Terraform, assim teremos o
suporte do intellisense, tornando o trabalho de escrever o código mais rapido.

> Caso baixou o zip, extraia o projeto antes de procurá-lo, pois não é possível abrir via arquivo zip

Vá até a paste a abra a pasta do projeto. Apos abrir o projeto abra um terminal, pode ser o integrado com o VSC, navegue
até as pastas `infra/`,`env/Prod` e `env/homolog` e execute o comando `terraform init` dentro delas, agora temos o
terraform iniciado e podemos começar a ultiliza-lo. Para criar a infraestrutura, execute o terraform apply em uma das
pastas de Produção (`env/Prod`) ou de Homologação (`env/homolog`) de acordo com o ambiente desejado.

Em seguida atualize o ambiente para a ultima versão de produção com:

```aws elasticbeanstalk update-environment --environment-name ambinete-de-producao --version-label ambinete-de-producao```

ou para homologação com:

```aws elasticbeanstalk update-environment --environment-name ambinete-de-homolog --version-label ambinete-de-homolog```