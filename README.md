# 🌐 Site do LabMAP - IME-USP

Bem-vindo ao repositório do site do Laboratório de Matemática Aplicada (LabMAP).

Este repositório contém o código-fonte e o conteúdo do site, que foi migrado do Wordpress para o Hugo e agora para o Jekyll, visando tornar o site mais simples de manter.

## 🛠 Pré-requisitos

Para administrar e contribuir cm o site, é necessário ter conhecimento básico de:

- **SSH:** Para acessar o repositório nos servidores da Rede IME (e possuir uma conta no grupo `labmap`);
- **GNU/Linux:** Para lidar com eventuais conflitos de permissões nos diretórios usados no "código-fonte".
- **Git:** Para controle de versão e automação de geração e deploy das páginas.
- **HTML/CSS (Opcional):** Apenas se desejar alterar a estrutura visual das páginas.

## 🚀 Começando

(informações sobre login, hospedagem e git clone)

Você pode rodar o site localmente instalando o [Jekyll](https://jekyllrb.com/) em sua máquina. Para isso, é preciso ter o [Ruby](https://www.ruby-lang.org/pt/). Uma sugestão é fazer tudo isso de dentro de um ambiente [Conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html).

1. Instale o Ruby, o compilador de C e C++ `c-compiler` e `cxx-compiler` e o `make`:

```bash
conda install -c conda-forge ruby c-compiler cxx-compiler make
```

2. Estando dentro do diretório do site, rode

```bash
bundle install
```

3. Para rodar um servidor local com o site, basta usar:

```bash
bundle exec jekyll serve
```

## 📝 Gerenciando o Conteúdo

O conteúdo escrito do site (os textos e páginas) fica nos arquivos `index.html` e no diretório `paginas/`, além dos tutoriais que ficam em `tutoriais/`.

### Criando e editando páginas

Para criar uma página, basta copiar alguma existente e editá-la. 

As páginas são escritas em **Markdown** ou **HTML** acompanhadas de um cabeçalho (Front-matter) para configuração. As páginas comuns precisam ter o seguinte cabeçalho:

```
---
layout: default
titulo: "Título da página"
data: 2026-08-16
permalink: "/link-permanente"
---
```

- O `layout` corresponde ao arquivo-base sobre o qual o conteúdo desta página será escrito, dentre os disponíveis no diretório `_layouts`.
- O `titulo` e a `data` são auto-descritivos;
- O `permalink` é o link permanente do site, que não precisa corresponder ao nome do arquivo. Quando alguém acessar `https://labmap.ime.usp.br/link-permanente`, será mandado para esta página.

### Tutoriais

Já para os tutoriais o cabeçalho é um pouco maior. Por exemplo, o tutorial de git `tutoriais/2026-08-12-introducao-ao-git/index.md`:

```
---
layout: post
titulo: Primeiros passos para Git e GitHub
resumo: Conceitos básicos de Git e uso do GitHub.
categoria: Introdutórios
data: 2026-08-12
autoria: Yuri
---
```

A `categoria` deve ser uma das que estão no arquivo `_data/tutoriais_categorias.yml`. Caso queira alguma que não está lá, só adicionar.

A estrutura de arquivos aqui é importante. Crie uma pasta com a data seguida do titulo do tutorial, como o `2026-08-12-introducao-ao-git` e escreva o tutorial em um `index.md` dentro dessa pasta. A mídia vai dentro dessa mesma pasta.

## 🎨 Alterando o Layout e Estilo

Se for necessário mudar o visual e a estrutura do site:

- **Layouts (HTML):** Estão em `_layouts/`.
- **Estilos e funcionalidades (CSS e JS):** Estão em `assets`.