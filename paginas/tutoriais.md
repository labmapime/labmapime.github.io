---
titulo: "Tutoriais"
permalink: "/tutoriais"
layout: default
---

<div class="caixa" markdown="1">
# Tutoriais

Visando facilitar o acesso à informações que MAPianos precisam buscar com alguma frequência, elaboramos alguns tutoriais.

Para sugestões ou envio de tutoriais, entre em contato pelo e-mail [labmap@usp.br](mailto:labmap@usp.br).

{% assign tutoriais = site.pages | where_exp: "item", "item.path contains 'tutoriais/'" %}

<div class="toc" markdown="1">
<ul>

{% for categoria in site.data.tutoriais_categorias %}
{% assign lista = tutoriais | where_exp: "item", "item.categoria contains categoria.nome" | sort: "title" %}
    <li>
        <a href="#{{ categoria.link }}">{{ categoria.nome }}</a>
        <ul>
        {% for tutorial in lista %}
            <li><a href="#{{ tutorial.link }}">{{ tutorial.titulo }}</a></li>
        {% endfor %}
        </ul>
    </li>
{% endfor %}
</ul>
</div>

{% for categoria in site.data.tutoriais_categorias %}
{% assign lista = tutoriais | where_exp: "item", "item.categoria contains categoria.nome" | sort: "title" %}
## {{ categoria.nome }} {#{{categoria.link}}}

<ul class="tutoriais-lista">
    {% for tutorial in tutoriais %}
        {% assign data = tutorial.data | date: "%d/%m/%Y" %}
        {% include tutorial.html %}
    {% endfor %}
</ul>
{% endfor %}

</div>