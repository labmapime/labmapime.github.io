---
title: "FAQ"
date: 2020-05-06T01:16:16-03:00
draft: false

stylesheets: ["style"]
---

## Como conecto meu notebook à internet no laboratório?

Para conectar seu notebook à internet disponível do LabMAP, envie um e-mail com
seu nome de usuário e endereço MAC da placa de rede da máquina que você deseja
que seja conectada para o administrador da rede.

## Tenho uma cota de disco rígido? Se sim, qual é?

Todo usuário da rede LabMAP tem direito a 2 GB de espaço privado em disco.
Existe, porém, o diretório público `/var/tmp`, e os arquivos que estão neste
diretório não são considerados para cálculo de uso da quota.

**CUIDADO:** Dados armazenados em `/var/tmp` são de acesso público. Ou seja,
todos os usuários podem ver e manipular tais arquivos.

## Como uso a impressora do laboratório?

Basta usar um programa que tenha impressão como uma de suas funcionalidades,
escolhendo a impressora "Tártaro" na hora de imprimir.

## Como posso alterar minha senha?

Para trocar sua senha, acesse sua conta através da rede local ou por SSH e
use o comando `passwd` no terminal.

O programa pedirá sua senha atual e que digite uma senha nova duas vezes. Se
todos os campos forem preenchidos corretamente --- o programa avisará caso
contrário ---, sua senha foi alterada.
