#!/bin/bash

#1. Aplicando permissão de execução aos scripts
chmod +x ./infra/scripts/start-minikube.sh
chmod +x ./infra/scripts/start-eks.sh
chmod +x ./infra/scripts/host.sh

#2. Função para verificar se AWS, HELM e TERRAFORM estão instalados
check_command() {
    if ! command -v "$1" &> /dev/null; then
        echo "$1 não está instalado. Por favor, instale-o antes de continuar."
        case $1 in
            aws)
                echo "Instruções de instalação para AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html"
                ;;
            helm)
                echo "Instruções de instalação para Helm: https://helm.sh/docs/intro/install/"
                ;;
            terraform)
                echo "Instruções de instalação para Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli"
                ;;
            minikube)
                echo "Instruções de instalação para Minikube: https://minikube.sigs.k8s.io/docs/start/"
                ;;
        esac
        exit 1
    fi
}

check_command "aws"
check_command "helm"
check_command "terraform"
check_command "minikube"

#2. Oferecer ao usuário como provisionar infraestrutura
echo "Olá, seja bem vindo à etapa de provisionamento do ambiente snackbar."
echo "Escolha como quer provisionar o ambiente:"
echo "1- Minikube"
echo "2- EKS"
read -p "Digite sua escolha (1 ou 2): " OPTION

case $OPTION in
    1)
        echo "Você escolheu Minikube."
        ./infra/scripts/start-minikube.sh
        ;;
    2)
        echo "Você escolheu EKS."
        ./infra/scripts/start-eks.sh
        ;;
    *)
        echo "Opção inválida. Por favor, escolha 1 ou 2."
        exit 1
        ;;
esac