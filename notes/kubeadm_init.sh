# command to run to get apiserver addr right and pod cidr based on flannel CNI
sudo ~/kubeadm init --apiserver-advertise-address 172.42.42.1 --pod-network-cidr 10.244.0.0/1
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf
kubectl apply -f ~/kube-flannel-rbac.yml
kubectl apply -f ~/kube-flannel.yml
