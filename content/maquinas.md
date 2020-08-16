---
title: "Máquinas"
date: 2020-05-14T03:33:23-03:00
draft: false

stylesheets: [ "style" ]
---

O LabMAP possui quatro máquinas locais e um servidor de acesso remoto:

| Máquina       | Processador           | Memória | Disco   |
| -----------   | --------------------- | -------:| -------:|
| `jaguatirica` | Core 2 Quad 2.40 GHz  | 32 GB   | 250 GB  |
| `palheiro`    | Core 2 Quad 2.40 GHz  | 20 GB   | 160 GB  |
| `maracaja`    | Core 2 Quad 2.40 GHz  | 32 GB   | 250 GB  |
| `mourisco`    | Core 2 Quad 2.40 GHz  | 32 GB   | 160 GB  |
| `lebre`       | Core i7-2600 3.40 GHz | 12 GB   | 1.80 TB |

Usuários ativos do laboratório podem acessar qualquer uma das máquinas acima
pelo protocolo SSH através do comando `ssh maquina_desejada`, de dentro da [Rede
IME][rime] (`ssh usuario@ime.usp.br`).

Além das máquinas listadas acima, o LabMAP conta com três máquinas que pertencem
à Rede IME e quatro servidores numéricos dedicados a pesquisa que requer
processamento intensivo, como análise numérica, dinâmica dos fluidos, computação
científica, otimização e processamento de dados.

São eles:

| Máquina      | Processador                                   | Memória | Disco    |
| -----------  | -------------------------------------------   | ------: | -------: |
| `cfd01`      | **4x** AMD Opteron 6376 (16c) 2.3 GHz         | 256 GB  | 3 TB     |
| `guepardo00` | **2x** Intel Xeon X5690 (6c/12t) 3.47 GHz     | 64 GB   | 3.5 TB   |
| `guepardo01` | **2x** Intel Xeon X5690 (6c/12t) 3.47 GHz     | 64 GB   | 1 + 2 TB |
| `ybytu`      | **2x** Intel Xeon Gold 6144 (8c/16t) 3.50 GHz | 540 GB  | 4 TB     |

[rime]: https://si.ime.usp.br/

## Acesso aos Servidores Numéricos

Antes de ter acesso aos servidores numéricos, é necessário solicitar uma conta
na máquina que pretende utilizar. Para tal, envie uma mensagem com o assunto
"Cálculo Numérico" para a administração do laboratório através do e-mail
[labmap@usp.br](mailto:labmap@usp.br). **Você deve dizer que uso pretende fazer
das máquinas** ao realizar a solicitação. O coordenador do laboratório então
entrará em contato para a criação da sua conta.

Uma vez criada sua conta, o acesso ao servidor é feito a partir da Rede IME.

Exemplo de acesso à máquina `ybytu` por um pesquisador cujo usuário na Rede IME
é `pascoal` e na máquina em questão é `pspascoal`:

{{< highlight bash >}}
# Acessando a Rede IME através do terminal.
ssh pascoal@ime.usp.br
# Acessando a Ybytu de dentro da Rede IME.
ssh pspacoal@ybytu
{{</ highlight >}}
