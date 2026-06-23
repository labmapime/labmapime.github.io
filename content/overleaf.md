---
title: "Overleaf LabMAP"
url: "/overleaf"
---

## Overleaf do LabMAP

O LabMAP possui uma instância local do **Overleaf** em teste, utilizada para edição de documentos em **LaTeX**.

### 🔑 Criação de conta

Para utilizar o Overleaf do LabMAP é necessário solicitar a criação de uma conta.

Envie um e-mail para **[labmap@usp.br](mailto:labmap@usp.br)** com as seguintes informações:

* **Assunto:** `[Criação de conta overleaf]`
* **Nome**
* **Instituição / vínculo com o LabMAP**
* **E-mail que será utilizado na conta**

Após a criação da conta, você receberá instruções para definir sua senha e acessar a plataforma.

### 🌐 Acesso ao sistema

> **⚠️ Aviso Importante sobre os Links:** > Utilizamos um serviço gratuito de roteamento que possui um limite mensal de acessos. Por isso, disponibilizamos **dois links** abaixo. Caso o link principal exiba uma mensagem de erro indicando que a capacidade foi atingida ("Limit Exceeded"), basta retornar aqui e utilizar o link reserva.

<p style="text-align:center; margin-top:20px;">
  <a href="https://vistaless-regan-noncatalytically.ngrok-free.dev/login" 
     style="background:#2c7be5; color:white; padding:12px 20px; text-decoration:none; border-radius:6px; font-weight:bold; display:inline-block; margin: 5px;">
     Acesso Principal
  </a>
  <a href="https://hypnoses-stank-imitation.ngrok-free.dev/login" 
     style="background:#f5a623; color:white; padding:12px 20px; text-decoration:none; border-radius:6px; font-weight:bold; display:inline-block; margin: 5px;">
     Acesso Reserva
  </a>
</p>

*Observação: Ao abrir a página, clique no botão azul **Visit site** se essa tela for exibida antes do login.*

---

### 🌐 Acesso ao sistema de forma direta (Avançado)

Utilize este método se os dois links de acesso acima estiverem com problemas.
O acesso é feito por meio da *Rede IME* e pelo servidor *cfd01*, portanto é necessário possuir previamente uma conta ativa em ambos.

Execute o seguinte comando no terminal:

{{< highlight bash >}}
ssh -L 8080:localhost:9700 "seu-usuario"@ime.usp.br -J "seu-usuario"@cfd01
{{< /highlight >}}

Esse comando estabelece um túnel SSH para acessar o servidor do laboratório através do servidor intermediário (ime.usp.br).

Após a conexão ser estabelecida, abra o navegador e acesse:

http://localhost:8080

Isso redirecionará a porta local **8080** para o serviço disponível na porta **9700** do servidor remoto.

---

### ℹ️ Observações

* O Overleaf ainda está em testes, por isso, recomendamos que salvem os arquivos (backup) localmente após o uso.
* Caso tenha problemas para acessar ou utilizar a plataforma, entre em contato pelo e-mail **[labmap@usp.br](mailto:labmap@usp.br)**.
