TODO List

* ArgoCD:

* OPA:
        * Deploy the OPA server using ArgoCD;

* Trino:
        * Deploy the Trino cluster using ArgoCD;
        * Templating the values file as for Ingress and for Oauth2.0 configuration;
        * Get user from OAuth2 (try to set user mapping rule);
                * Another approach would be setting the set "default allow := false" for OPA rules. It will disallow imparsonation to default user (trino user) and force to set --user flag when logging
                * Related links:
                        * https://github.com/trinodb/trino/issues/20289
                        * https://github.com/trinodb/trino/issues/18935
                        * https://github.com/trinodb/trino/issues/11547