#!/bin/bash

kubectl run beautiful-metabase --image=metabase/metabase \
  --env="DNS_DOMAIN=cluster" \
  --env="MB_DB_TYPE=postgres" \
  --env="MB_DB_DBNAME=materialize" \
  --env="MB_DB_PORT=6875" \
  --env="MB_DB_USER=materialize" \
  --env="MB_DB_PASS=password" \
  --env="MB_DB_HOST=localhost" \
  --port=3000