#!/bin/bash
openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -nodes  \
            -days 3650 \
            -out cert.crt \
            -keyout example.key \
            -subj "/C=EG/ST=GIZA/L=Giza/O=efe/OU=IT/CN=example.com"
