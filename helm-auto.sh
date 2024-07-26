#Manual
export KUBECONFIG=/mnt/c/kubeconfig/kube-test.yaml
helm get values prometheus-operator -n monitoring > current.yaml
helm upgrade prometheus-operator prometheus-operator/kube-prometheus-stack -f current.yaml -n monitoring

#Auto
for i in $(cat test); do export KUBECONFIG=/mnt/c/kubeconfig/$i.yaml; helm get values prometheus-operator -n monitoring > $i.yaml; ls $i.yaml; done
for i in $(cat test); do export KUBECONFIG=/mnt/c/kubeconfig/$i.yaml; helm upgrade prometheus-operator prometheus-operator/kube-prometheus-stack -f $i.yaml -n monitoring; echo "done "$i; done
