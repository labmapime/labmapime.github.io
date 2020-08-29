---
title: "FAQ"
date: 2020-05-06T01:16:16-03:00
draft: false

stylesheets: ["style"]
---

## Como posso alterar minha senha de usuário?

Para trocar sua senha, acesse sua conta através da rede local ou por SSH e
use o comando `passwd` no terminal.

O programa pedirá sua senha atual e que digite uma senha nova duas vezes. Se
todos os campos forem preenchidos corretamente --- o programa avisará caso
contrário ---, sua senha foi alterada.

## Como uso a impressora do laboratório?

Basta usar um programa que tenha impressão como uma de suas funcionalidades,
escolhendo a impressora "Tártaro" na hora de imprimir.

## Como posso acessar os servidores do laboratório?

Para acessar as máquinas que o laboratório faz disponíveis, basta usar o
protocolo SSH. O acesso se dá por meio da Rede IME, então é necessário ter uma
conta da Rede IME primeiro.

{{< highlight bash >}}
ssh meuuserime@ime.usp.br # entramos primeiro na Rede IME
ssh meuuserlab@maquina    # e então acessamos a máquina em questão
{{</ highlight >}}

### Tenho sempre que executar esses comandos manualmente?

Não! Se você puder configurar seu cliente SSH (para GNU/Linux e demais sistemas
UNIX-like, editar o arquivo `~/.ssh/config` para configurar o OpenSSH), essas
configurações te permite acessar a máquina `cfd01` através do comando `ssh
cfd01` diretamente da sua máquina:

```
Host redeime
    Hostname ime.usp.br
    User meuuserime
Host cfd01
    ProxyJump redeime
    User meuuserlab
```

E caso você tenha uma [chave SSH][sshkey], copie-a tanto para a Rede IME quanto
para a cfd01 e você não precisará digitar a senha de usuário manualmente toda
vida:

{{< highlight bash >}}
ssh-copy-id redeime
ssh-copy-id cfd01
{{</ highlight >}}

[sshkey]: https://www.ssh.com/ssh/keygen/
