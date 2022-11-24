
# 01

Pensando nos modelos de comunicação computacional, qual o sentido de transmissão utilizado no protocolo TCP/IP?

## Resposta

Full-Duplex

# 02

O que compõe um request?

## Resposta

Request Line, Headers e Body

# 03

Cite 5 métodos http

## Resposta

GET, POST, PUT, Patch, DELETE

# 04

Qual a diferença entre POST e PUT?

## Resposta

Post é para inserir novos dados, o PUT serve para atualizar todos as informações de um dado existente, caso não exista o dado a ser atualizado, então ele é criado.

# 05

Qual a diferença entre PUT e PATCH?

## Resposta

PUT atualiza todos os dados e PATCH apenas uma parte do dado, aquele que desejamos atualizar, sem precisar atualizar o resto.

# 06

Por meio de que podemos modular um request do tipo GET?

## Resposta

Através da query string.

# 07

O que é um header?

## Resposta

É o tipo de dado que desejamos receber

# 08

Um request sempre possui body?

## Resposta

Não, é opcional.

# 09

Um response sempre possui body?

## Resposta

Não.

# 10

Qual a diferença entre responses com status code na faixa dos 4xx e os que estiverem na faixa 5xx?

## Resposta

Na faixa dos 4xx significa que tem algo errado no lado do cliente e a faixa dos 5xx significa que tem algo errado no lado do server.

# 11

Em suas palavras, o que é uma API?

## Resposta

É uma aplicação que pode ser na web ou não que faz uma intermediação entre cliente e servidor, o cliente solicita algo do servidor e a API que busca a informação no server para retornar para o cliente.

# 12

O que é um JSON?

## Resposta

É um arquivo texto feito na estrutura javaScript que contém informações do servidor para o cliente utilizar, ao invés de acessar direto o banco do server, é fornecido dados em json para o cliente trabalhar em suas aplicações.

# 13

Desenvolver um app para exibição dos dados de clima de uma determinada cidade.

Para tanto sugestionamos a utilização da `Open Weather Map API`.

A sua utilização pode ser complicada, mas ainda é possível usá-la de uma maneira simples.

A documentação oficial da API pode ser encontrada aqui: https://openweathermap.org/current

Porém para nosso uso podemos utilizá-la da seguinte forma:

https://api.openweathermap.org/data/2.5/weather?q=Porto%20Alegre,br&units=metric&appid=aeefba332b49db396d425480b21571b2

onde temos:

- https://api.openweathermap.org - URL
- /data/2.5/weather - Recurso
- q=Porto%20Alegre,br - Nome Cidade,Código País
- units=metric - Dizendo que queremos os dados no sistema métrico
- appid=aeefba332b49db396d425480b21571b2 - A chave de utilização da API, gerei uma usando meu e-mail, se quiser pode gerar uma própria (recomendamos que faça isso)

O intuito é digitar em algum campo uma cidade brasileira e obter a temperatura dela.

Se quiserem estender para qualquer lugar do mundo podem, mas lembrem que vão ter que fazer as devidas tratativas para o código do país.

## Sugestão de Layout

Caso o app estiver em light mode:

<p align="center">
    <img src="./light-mode.png" width="400px" height="auto" />
</p>

Já se estiver em dark mode:

<p align="center">
    <img src="./dark-mode.png" width="400px" height="auto" />
</p>

## Assets

- [Fundo noite](./night-bg.jpg)
- [Fundo dia](./day-bg.jpg)
