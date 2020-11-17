# vshard on kubernetes

This example show how to deploy basic vshard'ed tarantool with default docker image and few configs.

1. create vshard config

    ```shell
    kubectl create cm --from-file vshard_config.lua vshard
    ```

1. create app as config

    ```shell
    kubectl create cm --from-file app.lua sharded
    ```

1. deploy 

    ```shell
    kubectl apply -f 3-sharded.yml
    ```

1. wait for instances to start

1. connect to any instance and bootstrap vshard

```shell
kubectl exec -it tarantool-0 -- sh
```

```shell

```
