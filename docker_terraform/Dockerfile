FROM hashicorp/terraform:1.0.2
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
WORKDIR /terraform
COPY . .
COPY entrypoint-create.sh entrypoint-destroy.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint-create.sh && \
    chmod +x /usr/bin/entrypoint-destroy.sh
ENTRYPOINT [ "/bin/ash" ]
