podname=$(kubectl --all-namespaces pods | sed "s/ .*//" | grep $1 | head -1)
givencommand=$2
cmd=${givencommand:-"bash"}
kubectl --all-namespaces exec -i -t $podname $cmd
