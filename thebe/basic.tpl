{%- extends 'basic.tpl' -%}

{% block codecell %}
<pre data-executable>
{{ cell.source }}
</pre>
{% endblock codecell %}

{% block markdowncell scoped %}
<div class="cellOOO border-box-sizing text_cell rendered">
{{ self.empty_in_prompt() }}
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
{{ cell.source  | markdown2html | strip_files_prefix }}
</div>
</div>
</div>
{%- endblock markdowncell %}
