local instance_name = os.environ()["TARANTOOL_INSTANCE_NAME"]
local cfg = require("vshard_config")
local my_uuid = nil

for _, c in pairs(cfg.sharding) do
  for uuid, replica in pairs(c.replicas) do
    if replica.name == instance_name then
      my_uuid = uuid
      break
    end
  end
end

local log = require("log")
log.info("APP SCRIPT")

assert(my_uuid)
local vshard = require("vshard")

log.info(type(box.cfg))

vshard.storage.cfg(cfg, my_uuid)
