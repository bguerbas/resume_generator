<h1 align="center">Gerador de currículos</h1> 

<p align="center">
  <img src="http://img.shields.io/static/v1?label=License&message=MIT&color=green&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=Ruby&message=2.6.3&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=Ruby%20On%20Rails%20&message=6.0.2.2&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=TESTES&message=%3E20&color=GREEN&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=RED&style=for-the-badge"/>
</p>

### Tópicos 

:small_blue_diamond: [Descrição do projeto](#descrição-do-projeto)

:small_blue_diamond: [Funcionalidades](#funcionalidades)

:small_blue_diamond: [Gems](#gems-e-libs-books)

:small_blue_diamond: [Layout](#layout-dash)

:small_blue_diamond: [Pré-requisitos](#pré-requisitos)

:small_blue_diamond: [Como rodar a aplicação](#como-rodar-a-aplicação-arrow_forward)

:small_blue_diamond: [Banco de Dados](#banco-de-dados)

:small_blue_diamond: [Como rodar os testes](#como-rodar-os-testes)

:small_blue_diamond: [Casos de Uso](#casos-de-uso)

:small_blue_diamond: [Licença](#licença)

## Descrição do projeto 

<p align="justify">
  O objetivo deste projeto é permitir com que um usuário (após a sua autenticação), possa preencher alguns formulários para registrar suas informações pessoais, experiencias, contatos e outras informações para gerar uma versão PDF do seu currículo. 
</p>

## Funcionalidades

:heavy_check_mark: Autenticação com Devise

:memo: Autenticação com o Google

:memo: Autenticação com o Linkedin

:memo: Preenchimento dos formulários para registro das informações do candidato 

:memo: Export do currículo como PDF

## Gems e libs :books:

- [Rails](https://rubyonrails.org/)
- [Devise](https://github.com/heartcombo/devise)

## Layout:dash:

Me baseei no site da Revelo para construir o layout da aplicação. 

![Screenshot_2020-09-29 Gerador de CV's](https://user-images.githubusercontent.com/46378210/94550566-4f76cd80-022a-11eb-92b4-f981fe93506c.png)

## Pré-requisitos

É necessário ter o [Docker](https://docs.docker.com/engine/install/ubuntu/) e o [Docker Compose](https://docs.docker.com/compose/install/) instalado na sua máquina. Para verificar, use `docker -v` e `docker-compose -v`:

Deve retornar algo como:

```bash
docker-compose version 1.26.2, build eefe0d31
```

```
Docker version 19.03.8, build afacb8b7f0
```

## Como rodar a aplicação :arrow_forward:

No **terminal padrão**, clone o projeto: 

```
$ git clone https://github.com/reginadiana/resume_generator
```

Acesse a pasta

```
$ cd resume_generator
```

Construia os containers e imagens com: 

```
$ docker-compose build
```

Para abrir o **terminal do docker**, execute:

```
$ docker-compose run --service-ports web bash
```

Para instalar as dependencias e rodar o projeto, execute em seguida:

```
$ bin/setup && rails s -b 0.0.0.0
```

Para rodar o projeto diretamente:
```
$ docker-compose up 
```

:warning: Se executar a aplicação com ```up```, terá que abrir outro terminal para rodar os testes, banco, etc com:
```
$ docker ps // Retornará uma lista com os containers em execução. 
```
Para abrir o terminal dessa execução, pegue o ID e execute o comando:
```
$ docker exec -it <container_ID> bash
```

## Banco de dados

O banco utilizado nessa aplicação foi o [pg](https://guides.rubyonrails.org/active_record_postgresql.html). 

## Como rodar os testes

Com o **terminal do docker** aberto, execute

```
$ rspec
```

## Casos de Uso

_Em breve_


## Licença 

The [MIT License]() (MIT)

Copyright :copyright: Ano - Titulo do Projeto
