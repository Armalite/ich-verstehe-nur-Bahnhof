## Elasticache

- Web service that makes it easy to deploy operate and scale an in memory cache in the cloud
- Fast - doesnt have to go to db to get info
- memcached / redis
- redis = no multithreaded performance, but good if you need backup restore and multi-az stuff
- Caching engine
- *You should store session in dynamodb* - shares user cached metadata across instances
