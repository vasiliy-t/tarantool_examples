local config = {
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
      },
      ["9657ba23-ca84-428b-ad97-6cc30d0558f7"] = {
          replicas = {
              ["12109a5d-d1fc-4ab3-a23c-a37a6c432ebb"] = {
                  name = "tarantool-1-0",
                  uri = "storage:storage@tarantool-1-0.tarantool.default.svc.cluster.local:3301",
                  master = true
              },
              ["cfda874a-a457-4b8a-a017-d345bd5a0413"] = {
                name = "tarantool-1-1",
                uri = "storage:storage@tarantool-1-1.tarantool.default.svc.cluster.local:3301",
            }
          }
      },
  },
  memtx_memory = 100 * 1024 * 1024,
  replication_connect_quorum = 0,
  memtx_dir = '/var/lib/tarantool',
  wal_dir = '/var/lib/tarantool',
  listen = 3301,
}

local instance_name = os.environ()["TARANTOOL_INSTANCE_NAME"]
local cfg = config
local my_uuid = nil
local is_master = false

for _, c in pairs(cfg.sharding) do
  for uuid, replica in pairs(c.replicas) do
    if replica.name == instance_name then
      my_uuid = uuid
      is_master = replica.master
      break
    end
  end
end

local log = require("log")

assert(my_uuid)
local vshard = require("vshard")


vshard.storage.cfg(cfg, my_uuid)
vshard.router.cfg(config)

if is_master == true then
  box.schema.create_space("customers", {if_not_exists = true})
  box.space.customers:format({
    {name="id", type="unsigned"},
    {name="name", type="string"},
    {name="age", type="number"},
  })
  box.space.customers:create_index("pk", {parts = {"id"}, if_not_exists = true})
end

box.schema.user.grant('guest', 'read,write,execute,create', 'universe', nil, {if_not_exists = true})
