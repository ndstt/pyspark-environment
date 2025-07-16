export NAME=ndstt

envsubst '${NAME}' < deployment_conf/jupyter-pod.yaml | kubectl apply -f -
