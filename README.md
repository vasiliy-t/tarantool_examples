# Tarantool examples

### CRUD storage

1. install helm repos

  ```shell
  $ helm repo add tarantool https://tarantool.github.io/tarantool-operator
  $ helm repo add tarantool-examples https://vasiliy-t.github.io/tarantool_examples
  ```

2. install tarantool operator

  ```shell
  $ helm install --set namespace=tarantool tarantool-operator tarantool/tarantool-operator --namespace tarantool --create-namespace --version 0.0.6
  ```

3. install CRUD storage

  ```shell
  $ helm install tarantool-crud tarantool-examples/crud-storage --namespace=tarantool
  ```
