#/bin/sh
{% for ip in groups[zk_hosts] %}
{% if  ip  == inventory_hostname %}
 sed -i 's/broker.id=0/broker.id={{ loop.index - 1 }}/g' {{install_dir}}/kafka_{{kafka_version}}/config/server.properties
{% endif %}
{% endfor %}
