local config = {
  memtx_memory = 100 * 1024 * 1024,
  sharding = {
      ["1437b89c-d73f-4612-be07-e59b566f09f1"] = {
          replicas = {
              ["b713e340-6df3-44c7-b55b-dbc9413c46f2"] = {
                  name = "tarantool-0",
                  uri = "storage:storage@tarantool-0.tarantool.default.svc.cluster.local:3301",
                  master = true
              },
              ["0e44fbf7-ebf9-45e0-9672-aeaaf09c508e"] = {
                name = "tarantool-1",
                uri = "storage:storage@tarantool-1.tarantool.default.svc.cluster.local:3301",
            }
          }
      }
  },
  replication_connect_quorum = 0,
}

return config
