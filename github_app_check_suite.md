# Github App Check Suite Events

### Identifying a pull request event from a Check Suite event:
This checks to see if the pull_requests list is empty or not - to determine if this check suite event originated from a PR
```Python
payload = await request.json()
is_pr_event = True if payload["check_suite"]["pull_requests"] else False
```