---
title: "Redirecionando para Overleaf"
layout: "redirect"
url: "/overleaf"
outputs:
  - html
---

<div style="font-family: sans-serif; text-align: center; margin-top: 50px;">
  <h2>Acedendo ao Overleaf LabMAP...</h2>
  <p>Se você não for redirecionado em 3 segundos, <a id="manual-link" href="https://vistaless-regan-noncatalytically.ngrok-free.dev/login">clique aqui</a>.</p>
</div>

<script>
  // A URL do seu túnel
  const targetUrl = "https://vistaless-regan-noncatalytically.ngrok-free.dev/login";

  // Função para pular o aviso do ngrok
  async function redirect() {
    try {
      // Faz uma chamada "silenciosa" com o header que o ngrok exige para pular o aviso
      await fetch(targetUrl, {
        method: "GET",
        headers: {
          "ngrok-skip-browser-warning": "true"
        },
        mode: 'no-cors' // Evita erros de política de domínio (CORS)
      });
      
      // Após o fetch, o browser "lembra" da permissão e redirecionamos
      window.location.href = targetUrl;
    } catch (e) {
      // Caso o fetch falhe, redireciona normalmente (o usuário verá o aviso do ngrok)
      window.location.href = targetUrl;
    }
  }

  // Executa a função ao carregar a página
  redirect();
</script>

<noscript>
  <meta http-equiv="refresh" content="0; url=https://vistaless-regan-noncatalytically.ngrok-free.dev/login">
</noscript>
