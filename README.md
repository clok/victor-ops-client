[![Build Status](https://travis-ci.org/clok/victor-ops-client.svg?branch=master)](https://travis-ci.org/clok/victor-ops-client)

VictorOps Ruby Client
---

A simple REST API client for use with the [VictorOps REST API](http://victorops.force.com/knowledgebase/articles/Integration/Alert-Ingestion-API-Documentation/)

# Install

```
gem install victor_ops-client
```

## Requirements

- Ruby 1.9.3 or higher
- `rest-client` & `awesome_print`
- VictorOps API Access

## Example

``` ruby
$:.unshift(File.join(File.dirname(__FILE__), "/../lib"))
require 'victor_ops-client'

# Required for Initializing Client
API_URL = 'https://alert.victorops.com/REST_END_POINT/API_KEY'
ROUTING_KEY = 'example_routing_key'

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
```

## Contributing

* Fork the project.
* Run `bundle install`
* Run `bundle exec rake`
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Run `bundle exec rake` (No, REALLY :))
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself in another branch so I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.