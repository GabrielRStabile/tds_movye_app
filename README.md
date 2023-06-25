<center><div style="display: block"><img src="https://i.imgur.com/48kRDkl.png" width="300"/></div>
<img src="https://i.imgur.com/7FeZuKG.png" width="130" /></div></center>

<center><h1>Movye App</h1></center>
Movye é um aplicativo de streaming de filmes e séries que permite que os usuários assistam a conteúdos gratuitos em seu dispositivo móvel. O projeto está sendo desenvolvimento durante a disciplina de Técnologia em Desenvolvimento de Sistemas na Universidade Técnológica Federal do Paraná Campus Medianeira.
<hr />
## Funcionalidades

- Login via e-mail ou redes sociais
- Procurar e filtrar filmes e séries por título, gênero, ano, classificação, idioma e outros critérios
- Adicionar itens à lista de favoritos e compartilhar com outros usuários
- Continuar assistindo de onde parou
- Reproduzir o conteúdo de vídeo com opções de legendas, áudios e resoluções
- Fornecer recomendações de conteúdo com base nas preferências do usuário e histórico de visualização
- Avaliar filmes e programas de televisão para ajudar a informar recomendações futuras

## Requisitos

- Compatível com dispositivos iOS e Android
- Carregar os recursos rapidamente e sem interrupções longas
- Armazenar as informações do usuário com segurança através de containers criptografados
- Ser responsivo e fácil de usar
- Acesso ao conteúdo se dará através de Tokens e Refresh Tokens que deverão ser enviados a cada requisição

## Regras de Negócio

- O conteúdo só pode ser acessado por usuários que fizeram login na plataforma
- O acesso ao conteúdo pode ser limitado de acordo com a idade do usuário
- O usuário não pode compartilhar sua conta com outros usuários
- O usuário não deve utilizar senhas para entrar no aplicativo, apenas código enviado por e-mail ou através dos logins sociais

## Casos de Uso

- Cadastro: O usuário cria sua conta no aplicativo utilizando e-mail ou redes sociais fornecendo: nome completo, idade.
- Login: O usuário faz login no aplicativo utilizando e-mail ou redes sociais. Caso seja e-mail o sistema enviará para ele um código de validação. Caso seja por redes sociais ele deve permitir entrar sem pedir um código.
- Pesquisar Conteúdo: O usuário pesquisa por um filme ou série utilizando a barra de pesquisa podendo combinar filtros diversos.
- Assistir Conteúdo: O usuário seleciona um filme ou programa de televisão para assistir.
- Adicionar à Lista de Reprodução: O usuário adiciona um filme ou série à sua lista de reprodução.

## Instalação

Para instalar o Movye, siga os passos abaixo:

1. Faça o download do repositório do GitHub
2. Execute o comando `flutter pub get` na pasta do projeto para instalar as dependências
3. Execute o comando `flutter run --release` para iniciar o aplicativo

## Contribuindo

Se você quiser contribuir para o Movye, siga os passos abaixo:

1. Fork este repositório
2. Crie uma nova branch (`git checkout -b feature/nome-da-sua-feature`)
3. Faça as alterações necessárias e adicione testes para elas
4. Faça o commit das alterações (`git commit -am 'Adicionando uma nova feature'`)
5. Faça o push para a branch (`git push origin feature/nome-da-sua-feature`)
6. Abra um Pull Request

## Licença

Este projeto está licenciado sob a licença MIT.
