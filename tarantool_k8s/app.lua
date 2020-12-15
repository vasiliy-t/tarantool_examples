local instance_name = os.environ()["TARANTOOL_INSTANCE_NAME"]
local instances = {
  ["tarantool-0"] = {
    instance_uuid = "b713e340-6df3-44c7-b55b-dbc9413c46f2",
    replicaset_uuid = "1437b89c-d73f-4612-be07-e59b566f09f1"
  },
  ["tarantool-1"] = {
    instance_uuid = "0e44fbf7-ebf9-45e0-9672-aeaaf09c508e",
    replicaset_uuid = "1437b89c-d73f-4612-be07-e59b566f09f1"
  },
}

assert(instance_name)
assert(instances[instance_name])

box.cfg(instances[instance_name])
