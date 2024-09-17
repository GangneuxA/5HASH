events {
        worker_connections 1024;
}

http {
    upstream prestashop_servers {
        ip_hash; # Active la persistance de session basée sur l'IP


        server ${container_name_prefix}-prestashop-0:80;
        %{ for idx in range(1, replica_count) ~}
        server ${container_name_prefix}-prestashop-${idx}:80;
        %{ endfor ~}
    }

    server {
        listen 80;

        location / {
            proxy_pass http://prestashop_servers;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;

        }
    }
}
