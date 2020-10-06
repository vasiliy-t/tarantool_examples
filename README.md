# Tarantool examples

### CRUD storage

1. install helm repos

  ```shell
  $ helm repo add tarantool-examples https://vasiliy-t.github.io/tarantool_examples
  ```

1. install CRUD storage

  ```shell
  $ helm install --set tarantool-operator.namespace=tarantool  crud tarantool-examples/crud-storage --namespace=tarantool --create-namespace --version 0.0.2
  ```
