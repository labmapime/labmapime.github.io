# 🌐 Site do LabMAP - IME-USP

Bem-vindo ao repositório do site do Laboratório de Matemática Aplicada (LabMAP).

Este repositório contém o código-fonte e o conteúdo do site, que foi migrado do WordPress para o **Hugo** (um gerador de páginas estáticas) visando tornar o site mais seguro, rápido e simples de manter.

## 🛠 Pré-requisitos

Para administrar e contribuir com o site, é necessário ter conhecimento básico de:
* **SSH**: Para acessar o repositório nos servidores da Rede IME (e possuir uma conta no grupo `labmap`).
* **GNU/Linux**: Para lidar com eventuais conflitos de permissões nos diretórios usados no "código-fonte".
* **Git**: Para controle de versão e automação da geração e deploy das páginas.
* **HTML/CSS (Opcional)**: Apenas se desejar alterar a estrutura visual das páginas.

## 🚀 Começando

O repositório do site está hospedado em `github.com/labmapime/labmapime.github.io`.

Para acessar o GitHub, faça o login com o e-mail do laboratório (`labmap@ime.usp.br`). É **fortemente recomendável** adicionar a sua chave pública de SSH ao GitHub do laboratório para realizar as modificações no repositório diretamente pela linha de comando, evitando ficar preso no 2FA ao acessar de fora da USP.

### Clonando o Repositório

Via HTTPS:
```bash
git clone https://github.com/labmapime/labmapime.github.io.git
```

Via SSH (Recomendado):
```bash
git clone git@github.com:labmapime/labmapime.github.io
```

> **Nota sobre o Deploy:** O site é atualizado automaticamente alguns minutos após você enviar suas alterações (`git push`) para o repositório.

## 📝 Gerenciando o Conteúdo

O conteúdo escrito do site (os textos e páginas) fica no diretório `content/` (exemplos atuais: `_index.md`, `cadastro.md`, `faq.md`, e `maquinas.md`).

### Criando e Editando Páginas

Você pode utilizar a CLI do Hugo para criar uma página nova (se estiver instalado em sua máquina):
```bash
hugo new minhapagina.md
```
Ou, alternativamente, copiar uma página existente e editá-la.

#### Estrutura da Página (Front-matter)
As páginas utilizam a linguagem **Markdown** acompanhadas de um cabeçalho (Front-matter) para configuração. Um exemplo:

```markdown
---
title: "Minha primeira página pelo Hugo"
slug: primeira-pagina
date: 2020-10-05
draft: false
stylesheets: ["style"]
---

Minha primeira página pelo Hugo. Olha só que fácil foi. Isso aqui é tudo Markdown, inclusive tabelas.
```

* O arquivo da página acima será gerado em `public/primeira-pagina/index.html` (acessível via `/primeira-pagina`) devido à diretiva `slug`.
* O `draft: false` garante que a página não seja tratada como rascunho e seja gerada publicamente.
* A diretiva `stylesheets` inclui automaticamente o CSS correspondente no `<header>` da página.

## 🎨 Alterando o Layout e Estilo

Se for necessário mudar o visual e a estrutura do site:
* **Layouts (HTML)**: Estão em `themes/labmap/`. Os arquivos que controlam a estrutura são `_default/single.html` e os componentes no diretório `partials`. A página inicial (Home) fica em `layouts/index.html`.
* **Estilos (SCSS)**: O estilo foi escrito em SCSS e está localizado em `themes/labmap/scss/`.
* **CSS Inline**: Para ajudar na renderização em conexões lentas, um CSS base e mínimo é incorporado diretamente no HTML através do arquivo `layouts/partials/mincss.html`.

## 📜 Histórico e Padrão de Commits

Lembre-se de verificar o `git log` antes de começar a codar para manter o mesmo estilo de commits que tem sido usado desde o começo do repositório (historicamente, costuma ser escrito em inglês). 

Faça suas alterações, crie o commit e faça o `git push`. O script de deploy cuidará do resto e o avisará se houver erros na geração!

---
*PS: A documentação original em PDF foi gerada com o Pandoc através do comando `pandoc website.md -o website.pdf`.*
