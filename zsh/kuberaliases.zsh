# Usage: k get pods
alias k='kubectl'
 
# What environment am I in?
alias kgc='kubectl config get-contexts'
 
function uc() {
    # Set my context to the domain environment
    # Usage: uc egg | uc fly | uc uat
    context=$1
    case $context in
        ax)    namespace=us-east-1-stg-ax;;
        fly)   namespace=us-east-1-stg-fly;;
        egg)   namespace=us-east-1-stg-egg;;
        uat)   namespace=us-east-1-uat-sc;;
        prod)  namespace=us-east-1-prod-sc;;
        eu)    namespace=eu-west-1-prod-sc;;
        *)     echo "Please specify a prefix";;
    esac
 
    kubectl config use-context $namespace
}
 
function kl() {
    # Tail logs for pods matching string
    # More docs: https://github.com/johanhaleby/kubetail
    # Usage: kl hermes-web
    # Usage: kl pony-content-user-digest-in-case-worker
    # Usage: kl pony-web,hermes-web,mojo-web
    kubetail $1
}
 
# The ks & ke commands are typically used in conjunction with the hs command.
# hs will return the pod names you would use with the ks/ke commands
# for example: hs pony
# returns the helm deploy for pony and we want to ssh ( exec ) into the console
# look for the console pod under v1/Pod section: pony-console-858fdbc4bf-7jw6q
# Now we can do: ke pony-console-858fdbc4bf-7jw6q which would give us the bash prompt
# inside the console
 
function hs() {
    # Returns the helm status of the current deployment
    # Usage: hs pony
    context=$(kubectl config current-context)
    helm status ${context}-${1}
}
 
function hh() {
    # Returns the helm status for helm 3 deployments
    # Usage: hh pony
    context=$(kubectl config current-context)
    helm3 get manifest ${context}-${1} | kubectl get -o wide -f -
    echo ""
    kubectl get pods | grep ${1}
}
 
function ks() {
    # Returns configuration details about the pod
    # Usage: ks pony-console-858fdbc4bf-7jw6q
    kubectl describe pods $1 | grep -w "Name:"
}
 
function ke() {
    # Execs into a pod ( SSH )
    # Usage: ke pony-console-858fdbc4bf-7jw6q
    kubectl exec -it $1 -- /bin/bash
}
 
function kv() {
    # Pass the ENV VAR you are wanting to find across all apps as a parameter and will print out variable from each app in that namespace
    # Usage: kv DATABASE
    for i in $(kubectl get configmaps | grep config | awk '{ print $1 }'); do echo $i; kubectl get configmap $i -o yaml | grep $1; done
}
 
# Exec into the console pod directly
# Usage: kc pony
function kc() {
    for i in $(kubectl get pods | grep ${1}-console | awk '{ print $1 }'); do kubectl exec -it $i -- /bin/bash; done
}
