argocd:
https://129.159.142.131:30443

jellyfin
http://129.159.142.131:8096
https://129.159.142.131:8920

uri.work.gd

freedomain.one

curl -vvv http://uri.work.gd/.well-known/acme-challenge/bSOfjsIX3zzYBKhJxR_p18KUtMR9KZgO_p8psUfKE7A
oci session authenticate (region 40)
oci session refresh --profile learn-terraform

terraform-docs markdown table --output-file README.md --output-mode inject /path/to/module


extend partition:
```
#not needed - sudo pvcreate /dev/sdb
lsblk
sudo vgextend ocivolume /dev/sdb
sudo lvextend -l +100%FREE /dev/ocivolume/root
sudo xfs_growfs /
df -h /
```

install kubectl
```
sudo su
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version
```
install helm
```
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm version
```

install k3s
```
systemctl disable firewalld --now
curl -sfL https://get.k3s.io | sh -
echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc
bash
kubectl get nodes
```

k9s
```
wget https://github.com/derailed/k9s/releases/download/v0.32.7/k9s_Linux_arm64.tar.gz
tar xzf k9s_Linux_arm64.tar.gz
mv k9s /usr/local/bin
wget -P ~/.config/k9s/skins/ https://raw.githubusercontent.com/derailed/k9s/refs/heads/master/skins/transparent.yaml
sed -i '/ui:/a\    skin: transparent' ~/.config/k9s/config.yaml
k9s
```

install argocd
```
kubectl create ns argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm install argo-cd argo/argo-cd --version 7.8.2 -n argocd --set server.service.type=NodePort --debug

#https://129.159.142.131:30443/
#kubectl -n default get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
#add repo to argocd
#https://github.com/UriZafrir/oracle-cloud-jellyfin.git
#kubectl apply -f root-app
```

jellyfin:
#http://129.159.142.131:8096/

```

#create certificate using 
cd /home/opc
openssl req -new -newkey rsa:4096 -days 36500 -nodes -x509 -keyout jellyfin.oci-cloud.com.key -out jellyfin.oci-cloud.com.crt

openssl pkcs12 -export -out jellyfin.oci-cloud.com.pfx -inkey jellyfin.oci-cloud.com.key -in jellyfin.oci-cloud.com.crt -passout pass:123456
cp jellyfin.oci-cloud.com.pfx /opt/jellyfin-data
#change owner of file to jellyfin:jellyfin
useradd jellyfin
cd /opt/jellyfin-data
chown jellyfin:jellyfin jellyfin.oci-cloud.com.pfx
then allow https in dashboard-networking and enter the password
then restart
then check in container:
apt update && apt install net-tools && netstat -ln
```




