# 🕹️ Jogo da Velha Online com Flutter e Firebase

Este é um projeto de um **Jogo da Velha online**, desenvolvido com **Flutter** e **Firebase Firestore**, com hospedagem em tempo real usando **Firebase Hosting**. O objetivo principal foi aplicar conceitos de desenvolvimento mobile com Flutter, integrando banco de dados em tempo real e publicação web.

---

## 🎯 Objetivo do Projeto

- Desenvolver um aplicativo Flutter com **banco de dados em tempo real** usando **Firebase Firestore**
- Criar um **jogo da velha jogável entre dois usuários**
- Publicar a versão web do app com **Firebase Hosting**

---

## 🧠 Desafios Propostos na Aula

Durante o desenvolvimento, foram propostos alguns desafios com foco em lógica de programação e experiência do usuário:

1. **Criar função `verificarVencedor()`**  
   Função responsável por detectar vitórias nas jogadas e empates, analisando as combinações possíveis da matriz do jogo.

2. **Adicionar botão "Novo Jogo"**  
   Implementação de um botão para reiniciar o jogo, resetando o estado do tabuleiro e os jogadores.

3. **Mostrar mensagens de resultado**  
   Exibir mensagens como **"Vitória do X"**, **"Vitória do O"** ou **"Empate"** de forma clara e responsiva para os jogadores.

---

## 🚀 Tecnologias Utilizadas

| Tecnologia      | Descrição                                              |
|----------------|----------------------------------------------------------|
| **Flutter**     | Framework para desenvolvimento mobile multiplataforma   |
| **Dart**        | Linguagem de programação utilizada no Flutter           |
| **Firebase Firestore** | Banco de dados NoSQL em tempo real                  |
| **Firebase Hosting**   | Serviço de hospedagem para o deploy da versão web   |
| **C++**         | Utilizado para treinar lógica e estrutura algorítmica   |

---

## 🔧 Funcionalidades do App

- Tabuleiro de jogo com interação entre dois jogadores
- Sincronização em tempo real com Firebase Firestore
- Lógica de verificação de vitórias e empates
- Reinício rápido do jogo com botão "Novo Jogo"
- Interface responsiva para web e mobile
- Publicação automática via Firebase Hosting

---

## 🔥 Como Rodar o Projeto

### Pré-requisitos

- Flutter SDK instalado
- Conta Firebase configurada
- Firebase CLI instalada (`npm install -g firebase-tools`)

### Passos

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/jogo-da-velha-flutter.git
   cd jogo-da-velha-flutter
2. Instale as dependências do projeto:
   ```bash
   flutter pub get
3. Configure o Firebase com seu projeto:

- Crie um projeto no Firebase Console
- Ative Firestore e Hosting
- Adicione o arquivo google-services.json (Android) e/ou GoogleService-Info.plist (iOS)

4. Rode o app localmente:
   ```bash
   flutter run
5. Faça o build para web e publique:
   ```bash
   flutter build web
   firebase login
   firebase init hosting
   firebase deploy

---

## Autores: 
- Henrique Menel e Juscelino Brandão
