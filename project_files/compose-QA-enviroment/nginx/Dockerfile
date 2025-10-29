FROM nginx AS runner
WORKDIR /main
COPY . .
RUN chmod +x generate-ssl.sh && ./generate-ssl.sh && mv cert.crt /etc/ssl/certs/cert.pem && mv example.key /etc/ssl/private/example.key
RUN mv nginx.conf /etc/nginx/
