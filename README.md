TODO List

* Terraform:
        * Investigate why terraform isn't correctly deleting all resources:
                * ACM Certificate:
                        * It is associated to load balancers: investigate why they aren't deleted before
                * ArgoCD deploy: uninstallation completed with 1 error(s): context deadline exceeded
                * VPC deletion: only deletes after manually deletion...

* Trino:
        * Pass Oauth2 values trough secrets using External Secrets Operator;
        * Get user from OAuth2 (try to set user mapping rule);
                * Another approach would be setting the set "default allow := false" for OPA rules. It will disallow imparsonation to default user (trino user) and force to set --user flag when logging
                * Related links:
                        * https://github.com/trinodb/trino/issues/20289
                        * https://github.com/trinodb/trino/issues/18935
                        * https://github.com/trinodb/trino/issues/11547