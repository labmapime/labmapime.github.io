---
title: "Máquinas"
date: 2022-05-18
draft: false

stylesheets: [ "style" ]
---

O LabMAP possui cinco máquinas locais:

| Máquina       | Processador                 | Memória | Disco &nbsp;&nbsp;&nbsp; | /storage |
| -----------   | --------------------------- | ------: | -----------------------: | -------: |
| `macambira`   | Core i9-9900K 3.60GHz       |   32 GB |                 Rede IME |   800 GB |
| `mumuninha`   | Core i7-7700 3.60GHz        |   16 GB |                 Rede IME |   800 GB |
| `palheiro`    | Ryzen 5 PRO 4650GE 3.30 GHz |   15 GB |                 Rede IME |   800 GB |
| `maracaja`    | Ryzen 5 PRO 4650GE 3.30 GHz |   15 GB |                 Rede IME |   800 GB |
| `lagartixeiro`| Core i9-10900k       |    30 GB |                 Rede IME |     930 GB |

Usuários ativos do laboratório podem acessar qualquer uma das máquinas acima
pelo protocolo SSH através do comando `ssh maquina_desejada`, de dentro da [Rede
IME][rime] (`ssh usuario@ime.usp.br`). Utilize o `/storage` ao invés
da `/home`para armazenar arquivos de simulação ou instalar programas.

Para o acesso por SSH a essas máquinas é necessário um cadastro específico.
Se você já é usuário do LabMAP e não consegue se conectar a essas máquinas por SSH, isso pode
significar que sua conta ainda não possui acesso. Nesse caso envie um e-mail para [labmap@usp.br](mailto:labmap@usp.br) relatando o seu problema. 

Além disso, também há duas máquinas com Windows instalado, porém sem acesso
por SSH: 

| Máquina     | Processador                 | Memória |    Disco |
| ----------- | --------------------------- | ------: | --------:|
| `patinho01` | Core i7-3770 3.40 GHz       |    8 GB |   256 GB |
| `patinho02` | Core i7-13700 2.10 GHz      |   32 GB |     1 TB |

A máquina patinho01 usa Windows 10 e a patinho 02 utiliza Windows 11.
Para usá-las presencialmente, solicite a criação de uma conta entrando 
em contato com a administração do LabMAP.

Além das máquinas listadas acima, o LabMAP conta com três máquinas que pertencem
à Rede IME e quatro servidores numéricos dedicados a pesquisa que requer
processamento intensivo, como análise numérica, dinâmica dos fluidos, computação
científica, otimização e processamento de dados.

São eles:

| Máquina      | Processador                                   | Memória |    Disco |
| ------------ | --------------------------------------------- | ------: | -------: |
| `cfd01`      | **4x** AMD Opteron 6376 (16c) 2.3 GHz         |  256 GB | 2 + 6 TB |
| `guepardo00` | **2x** Intel Xeon X5690 (6c/12t) 3.47 GHz     |   64 GB |   3.5 TB |
| `guepardo01` | **2x** Intel Xeon X5690 (6c/12t) 3.47 GHz     |   64 GB | 1 + 2 TB |
| `ybytu`      | **2x** Intel Xeon Gold 6144 (8c/16t) 3.50 GHz |  540 GB |     4 TB |

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
