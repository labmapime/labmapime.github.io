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

## Como posso deixar um programa rodando ininterruptamente?

Se quiser rodar um programa sem precisar manter a sessão SSH aberta, 
você pode usar o comando `nohup`:

{{< highlight bash >}}
nohup programa > saida.out &
{{</ highlight >}}

Dessa forma, o programa vai ser executado em plano de fundo e não será mais 
interrompido ao sair da sessão SSH. Note que a saída será redirecionada
para `saida.out` que poderá ser visualizada em tempo real com o comando:

{{< highlight bash >}}
tail -f -n1 saida.out
{{</ highlight >}}

Também é possível usar o comando [`screen`][screen] como alternativa ao `nohup`. Para isso, 
basta criar uma [sessão][sessão] do `screen`, rodar seu programa e colocar a sessão em plano de
fundo com `Ctrl+a d`. Para recuperar a sessão, rode o `screen` com a flag `-x` ou `-r` junto com
o nome da sessão.

[screen]: https://wiki.archlinux.org/title/GNU_Screen#Usage 
[sessão]: https://wiki.archlinux.org/title/GNU_Screen#Named_sessions

### Mas como faço para encerrar a execução do programa?

Há várias formas de fazer isso, a mais simples delas é usar o comando `killall`:

{{< highlight bash >}}
killall programa
{{</ highlight >}}

Que irá terminar com todas as execuções do programa no momento. Caso você queira 
parar uma execução em específico, procure o `PID` do programa com:

{{< highlight bash >}}
ps -fC programa
{{</ highlight >}}

E passe o respectivo `PID` como argumento para o comando `kill`:

{{< highlight bash >}}
kill PID # se não funcionar tente kill -9 PID
{{</ highlight >}}



### Usei o `nohup` mas nada está sendo impresso no arquivo de saída!

Provavelmente, a causa disso é que o programa não está descarregando o buffer de
saída, tente rodar com o comando `stdbuf`:

{{< highlight bash >}}
stdbuf -o0 nohup programa > saida.out &
{{</ highlight >}}

### O que faço se já comecei executar o programa, mas preciso encerrar minha sessão?

Primeiro, se o programa não estiver rodando em plano de fundo, pause-o com `ctrl-z`. 

Depois, desvincule o programa da sessão a partir de seu `PID`:

{{< highlight bash >}}
ps -fC programa
disown PID
{{</ highlight >}}

Se a saída padrão do programa já estiver redirecionada para um arquivo e o programa 
estiver pausado, despause-o com `kill -CONT PID`.

Caso a saída não esteja redirecionada, há duas opções:
- Abrir uma sessão do `screen` e vincular o programa a ela com o comando `reptyr PID` 
(não esqueça de colocar a sessão em plano de fundo com o comando `ctrl-a d`);
- Redirecionar a saída do programa para um arquivo com o programa [`reredirect`][reredirect].

Pronto! Agora você já pode sair da sua sessão sem mais problemas. 

[reredirect]: https://github.com/jerome-pouiller/reredirect/
