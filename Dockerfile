FROM lscr.io/linuxserver/openvscode-server:latest

LABEL maintainer="prmiguel <miangel-pr@outlook.com>"

RUN /app/openvscode-server/bin/openvscode-server --install-extension redhat.vscode-yaml && \
    /app/openvscode-server/bin/openvscode-server --install-extension ms-kubernetes-tools.vscode-kubernetes-tools && \
    /app/openvscode-server/bin/openvscode-server --install-extension ipedrazas.kubernetes-snippets && \
    /app/openvscode-server/bin/openvscode-server --install-extension dag-andersen.kubernetes-reference-highlighter && \
    apt update && \
    apt install -y curl && \
    curl -LO https://dl.k8s.io/release/v1.29.2/bin/linux/amd64/kubectl && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    mkdir /code && chmod -R 777 /code
# RUN /app/openvscode-server/bin/openvscode-server --install-extension tumido.crd-snippets
# RUN /app/openvscode-server/bin/openvscode-server --install-extension lunuan.kubernetes-templates 
# RUN /app/openvscode-server/bin/openvscode-server --install-extension redhat.vscode-knative 
# RUN /app/openvscode-server/bin/openvscode-server --install-extension Bridgecrew.checkov 
# RUN /app/openvscode-server/bin/openvscode-server --install-extension okteto.kubernetes-context

WORKDIR /code
