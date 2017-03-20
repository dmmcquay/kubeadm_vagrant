ROOT=$GOPATH/src/github.com/dmmcquay/kubeadm_vagrant
KUBEADM=k8s.io/kubernetes/cmd/kubeadm 
BIN=$ROOT/bin
CNI=$ROOT/cni

cd $BIN
GOARCH=amd64 GOOS=linux go build $KUBEADM
cd $ROOT
vagrant up
vagrant scp $BIN/kubeadm n1:~/
vagrant scp $BIN/kubeadm n2:~/
vagrant scp $CNI/kube-flannel.yml n1:~/
vagrant scp $CNI/kube-flannel.yml n2:~/
