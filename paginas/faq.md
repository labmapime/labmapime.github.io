---
layout: default
titulo: "FAQ"
data: 2020-05-06T01:16:16-03:00
permalink: "/faq"
---

<div class="caixa" markdown="1">
# FAQ

<div class="toc" markdown="1">

- [Como posso alterar minha senha de usuário?](#como-posso-alterar-minha-senha-de-usuário)
- [Como posso acessar os servidores do laboratório?](#como-posso-acessar-os-servidores-do-laboratório)
  - [Tenho sempre que executar esses comandos manualmente?](#tenho-sempre-que-executar-esses-comandos-manualmente)
- [Como faço para transferir arquivos entre meu computador e uma máquina do laboratório?](#como-faço-para-transferir-arquivos-entre-meu-computador-e-uma-máquina-do-laboratório)
- [Como posso deixar um programa rodando ininterruptamente?](#como-posso-deixar-um-programa-rodando-ininterruptamente)
  - [Mas como faço para encerrar a execução do programa?](#mas-como-faço-para-encerrar-a-execução-do-programa)
  - [Usei o `nohup` mas nada está sendo impresso no arquivo de saída!](#usei-o-nohup-mas-nada-esta-sendo-impresso-no-arquivo-de-saída)
  - [O que faço se já comecei executar o programa, mas preciso encerrar minha sessão?](#o-que-faco-se-ja-comecei-a-executar-o-programa-mas-preciso-encerrar-minha-sessao)

</div>
</div>

<div class="caixa" markdown="1">

## Como posso alterar minha senha de usuário? 

Para trocar sua senha, acesse sua conta através da rede local ou por SSH e
use o comando `passwd` no terminal.

O programa pedirá sua senha atual e que digite uma senha nova duas vezes. Se
todos os campos forem preenchidos corretamente --- o programa avisará caso
contrário ---, sua senha foi alterada.

</div>

<div class="caixa" markdown="1">

## Como posso acessar os servidores do laboratório?

Para acessar as máquinas que o laboratório faz disponíveis, basta usar o
protocolo SSH. O acesso se dá por meio da Rede IME, então é necessário ter uma
conta da Rede IME primeiro.

```
ssh meuuserime@ime.usp.br # entramos primeiro na Rede IME
ssh meuuserlab@maquina    # e então acessamos a máquina em questão
```

---

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

```
ssh-copy-id redeime
ssh-copy-id cfd01
```

[sshkey]: https://www.ssh.com/ssh/keygen/

</div>

<div class="caixa" markdown="1">

## Como faço para transferir arquivos entre meu computador e uma máquina do laboratório?

Para copiar um arquivo ou pasta localizado em `origem` na sua máquina
para `destino` em outra máquina (e vice-versa),
use o comando [`rsync`][rsync]:

```
rsync -Pr origem meuuserlab@maquina:destino
```

ou

```
rsync -Pr meuuserlab@maquina:origem destino
```

Adicione `-e "ssh -J meuuserime@ime.usp.br"` 
como argumento para o `rsync` caso
caso você não tenha seguido os passos de [Tenho sempre que executar esses comandos manualmente?](#tenho-sempre-que-executar-esses-comandos-manualmente)
.

Você também pode usar o comando
[`scp`][scp]
como alternativa ao `rsync`. 

[rsync]: https://wiki.archlinux.org/title/Rsync#As_cp/mv_alternative
[scp]: https://wiki.archlinux.org/title/SCP_and_SFTP#Secure_copy_protocol_(SCP)

</div>

<div class="caixa" markdown="1">

## Como posso deixar um programa rodando ininterruptamente?

Se quiser rodar um programa sem precisar manter a sessão SSH aberta, 
você pode usar o comando `nohup`:

```
nohup programa > saida.out &
```

Dessa forma, o programa vai ser executado em plano de fundo e não será mais 
interrompido ao sair da sessão SSH. Note que a saída será redirecionada
para `saida.out` que poderá ser visualizada em tempo real com o comando:

```
tail -f -n1 saida.out
```

Também é possível usar o comando [`screen`][screen] como alternativa ao `nohup`. Para isso, 
basta criar uma [sessão][sessão] do `screen`, rodar seu programa e colocar a sessão em plano de
fundo com `Ctrl+a d`. Para recuperar a sessão, rode o `screen` com a flag `-x` ou `-r` junto com
o nome da sessão.

[screen]: https://wiki.archlinux.org/title/GNU_Screen#Usage 
[sessão]: https://wiki.archlinux.org/title/GNU_Screen#Named_sessions

---

### Mas como faço para encerrar a execução do programa?

Há várias formas de fazer isso, a mais simples delas é usar o comando `killall`:

```
killall programa
```

Que irá terminar com todas as execuções do programa no momento. Caso você queira 
parar uma execução em específico, procure o `PID` do programa com:

```
ps -fC programa
```

E passe o respectivo `PID` como argumento para o comando `kill`:

```
kill PID # se não funcionar tente kill -9 PID
```

---

### Usei o `nohup` mas nada está sendo impresso no arquivo de saída!

Provavelmente, a causa disso é que o programa não está descarregando o buffer de
saída, tente rodar com o comando `stdbuf`:

```
stdbuf -o0 nohup programa > saida.out &
```

---

### O que faço se já comecei executar o programa, mas preciso encerrar minha sessão? {:# teste}

Primeiro, se o programa não estiver rodando em plano de fundo, pause-o com `ctrl-z`. 

Depois, desvincule o programa da sessão a partir de seu `PID`:

```
ps -fC programa
disown PID
```

Se a saída padrão do programa já estiver redirecionada para um arquivo e o programa 
estiver pausado, despause-o com `kill -CONT PID`.

Caso a saída não esteja redirecionada, há duas opções:
- Abrir uma sessão do `screen` e vincular o programa a ela com o comando `reptyr PID` 
(não esqueça de colocar a sessão em plano de fundo com o comando `ctrl-a d`);
- Redirecionar a saída do programa para um arquivo com o programa [`reredirect`][reredirect].

Pronto! Agora você já pode sair da sua sessão sem mais problemas. 

[reredirect]: https://github.com/jerome-pouiller/reredirect/

</div>