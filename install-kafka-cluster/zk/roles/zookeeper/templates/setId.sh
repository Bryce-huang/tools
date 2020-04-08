#/bin/sh
{% for ip in groups[zk_hosts] %}
{% if  ip  == inventory_hostname %}
echo {{ loop.index - 1 }} > {{install_dir}}/{{data_dir}}/myid
{% endif %}
{% endfor %}
