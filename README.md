# Helm Charts for deploying the c.rh.c. Edge Management Service

This is an experiment on how to package and deploy the [console.redhat.com edge management service](https://console.redhat.com/edge/fleet-management) ("Edge API") in a way that

* allows the use in on-prem disconnected environments,
* focusses on end-users rather than the developers and SREs of a managed service being continuously deployed, and
* is minimal, removing dependencies needed only by the managed service.

> [!WARNING]
> This is work in progress and likely to not be in a working state. It's also definitively not secure or suitable for production environments.

## Deploying

Prerequisites:

* kubeadmin access to an OpenShift 4.13 cluster
* `git`, `oc`, and `helm` installed

Procedure:

1. Clone the repo and `cd` into it.
2. In all `values.yaml` replace the hardcoded base domain "management-hub.redhat-et.edge-lab.net" with that of your cluster.
3. Ensure that you have DNS entries (e.g. in `/etc/hosts`) for `edge-api.apps.${YOUR_BASEDOMAIN}` and `sso.apps.${YOUR_BASEDOMAIN}`.
4. Deploy the service with Helm into the "demo" namespace:

    ```
    helm install --create-namespace -n demo edge-management .
    ```

5. Wait. A long time.
6. Use the credentials in `charts/base-crc-infra/charts/sso/values.yaml` to log into the Keycloak UI or the application frontend.

