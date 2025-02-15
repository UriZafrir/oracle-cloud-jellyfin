oci session authenticate (region 40)
oci session refresh --profile learn-terraform

terraform-docs markdown table --output-file README.md --output-mode inject /path/to/module

install packages


```
sudo su
#install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version
```
install helm
```
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm version
```

install k3s
```
systemctl disable firewalld --now
curl -sfL https://get.k3s.io | sh -
echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc
bash
```



install argocd
```
helm repo add argo https://argoproj.github.io/argo-helm
helm install argo-cd argo/argo-cd --version 7.8.2 --set server.service.type=NodePort --debug
```
https://151.145.82.131:30443/
kubectl -n default get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

install 