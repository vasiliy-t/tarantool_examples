# Tarantool examples

### CRUD storage

1. install helm repos

  ```shell
  $ helm repo add tarantool-examples https://vasiliy-t.github.io/tarantool_examples
  ```

1. install CRUD storage

  ```shell
  $ helm install crud tarantool-examples/crud-storage --namespace=tarantool --create-namespace --version 0.0.3
  ```
