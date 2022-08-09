# Github App Check Suite Events

### Identifying a pull request event from a Check Suite event:
This checks to see if the pull_requests list is empty or not - to determine if this check suite event originated from a PR
```Python
payload = await request.json()
is_pr_event = True if payload["check_suite"]["pull_requests"] else False
```

### Post a PR comment using Check Suite PR details
The last 2 lines in the below example fetches the PR number to get the PR issue object, and then uses this to post a message to the PR
```Python
import github
from github import GithubIntegration, Github

github_integration = GithubIntegration(
    int(settings.github_app_id),
    app_key,
    base_url=settings.github_api_base_url
)
git_token = github_integration.get_access_token(installation_id).token
github_api = Github(
    login_or_token=git_token,
    base_url=settings.github_api_base_url
)
github_repo = github_api.get_repo(repository_id)
issue = github_repo.get_issue(number=payload['check_suite']['pull_requests'][0]['number'])
issue.create_comment("THIS IS A PR LOL!")
```