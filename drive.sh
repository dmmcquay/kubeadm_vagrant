ROOT=$GOPATH/src/github.com/dmmcquay/kubeadm_vagrant
KUBEADM=k8s.io/kubernetes/cmd/kubeadm 
BIN=$ROOT/bin
CNI=$ROOT/cni
NOTES=$ROOT/notes

rm $BIN/*
cd $BIN
echo "building kubeadm"
GOARCH=amd64 GOOS=linux go build $KUBEADM
cd $ROOT
echo "bringing up vms"
vagrant up
echo "copying over files"
vagrant scp $BIN/kubeadm n1:~/
vagrant scp $BIN/kubeadm n2:~/
vagrant scp $CNI/kube-flannel.yml n1:~/
vagrant scp $CNI/kube-flannel-rbac.yml n1:~/
vagrant scp $NOTES/kubeadm_init.sh n1:~/
vagrant scp $NOTES/kubeadm_join.sh n2:~/
