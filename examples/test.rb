#! /usr/bin/env ruby

$:.unshift(File.join(File.dirname(__FILE__), "/../lib"))
require 'victor_ops/client'

# Required for Initializing Client
API_URL = 'INSERT_URL_HERE'
ROUTING_KEY = 'INSERT_ROUTING_KEY_HERE'

client = VictorOps::Client.new api_url: API_URL, routing_key: ROUTING_KEY

# Send a CRITICAL alert
client.critical 'THE DISK IS FULL!!!'

# Send a WARNING alert
client.warn desc: 'Disk is nearing capacity', stats: `df -h`

# Send an INFO alert
client.info [ 'this', 'is', 'an', 'array' ]

# Send an ACKNOWLEDGMENT
client.ack 'bot ack'

# Send a RECOVERY
client.recovery desc: 'Disk has space', emoji: ':saiyan:'