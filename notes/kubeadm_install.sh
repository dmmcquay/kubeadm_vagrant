# command to run to get apiserver addr right and pod cidr based on flannel CNI
sudo ~/.kubeadm --apiserver-advertise-address 172.42.42.1 --pod-network-cidr 10.244.0.0/16
