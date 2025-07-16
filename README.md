# Pyspark Environment

To deploy jupuyter on K8s
`kubectl apply -f jupyter-pod.yaml`

To delete jupyter from K8s
`kubectl delete -f jupyter-pod.yaml`

To delete pod immediately
`kubectl delete -f jupyter-pod.yaml --grace-period=0 --force`