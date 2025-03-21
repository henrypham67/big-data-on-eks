PHONY: expose-argo
expose-argo:
	kubectl port-forward -n argocd svc/argocd-server 30080:80

deploy:
	terraform init -upgrade
	terraform apply -auto-approve

clean:
	rm terraform.tfstate*

get-kubeconfig:
	aws eks update-kubeconfig --name big-data-on-eks --profile test --kubeconfig .kubeconfig