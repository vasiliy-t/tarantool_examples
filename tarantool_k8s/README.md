# Running Tarantool on kubernetes

### Single instance

```shell
kubectl create cm --from-file app.lua app
```

```shell
kubectl apply -f 1-single-instance.yml
```

Drawbacks:

- does not scales

- no failover

- no way to upgrade without downtime

### Single instance with replication

```shell
kubectl apply -f 2-master-master.yml
```

The trick is to set proper `TARANTOOL_REPLICATION` env variable pointing to instance DNS name within kubernetes service. 

Drawbacks:

- scales reads

- manual scale

- replication reconfiguration results in all instances restart
