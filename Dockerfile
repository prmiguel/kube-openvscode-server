FROM lscr.io/linuxserver/openvscode-server:latest

RUN /app/openvscode-server/bin/openvscode-server --install-extension redhat.vscode-yaml && \
    /app/openvscode-server/bin/openvscode-server --install-extension ms-kubernetes-tools.vscode-kubernetes-tools && \
    /app/openvscode-server/bin/openvscode-server --install-extension ipedrazas.kubernetes-snippets && \
    /app/openvscode-server/bin/openvscode-server --install-extension dag-andersen.kubernetes-reference-highlighter && \
    mkdir /code && chmod -R 777 /code
# RUN /app/openvscode-server/bin/openvscode-server --install-extension tumido.crd-snippets
# RUN /app/openvscode-server/bin/openvscode-server --install-extension lunuan.kubernetes-templates 
# RUN /app/openvscode-server/bin/openvscode-server --install-extension redhat.vscode-knative 
# RUN /app/openvscode-server/bin/openvscode-server --install-extension Bridgecrew.checkov 
# RUN /app/openvscode-server/bin/openvscode-server --install-extension okteto.kubernetes-context

WORKDIR /code
