events {
}

http {
    upstream prestashop_servers {
        # Définit la liste des serveurs PrestaShop avec des checks de santé
        server ${container_name_prefix}-prestashop-0:80 max_fails=3 fail_timeout=30s;
        %{ for idx in range(1, replica_count) ~}
        server ${container_name_prefix}-prestashop-${idx}:80 max_fails=3 fail_timeout=30s;
        %{ endfor ~}

        # Active la gestion du basculement en cas de serveur non disponible
        keepalive 32;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://prestashop_servers;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;

            # Paramètres supplémentaires pour surveiller les serveurs
            proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
            proxy_connect_timeout 5s;
            proxy_send_timeout 5s;
            proxy_read_timeout 5s;
        }
    }
}
