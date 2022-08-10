# Github App Check Runs

### Creating a check run
The last line in the below example will create a check_run for the provided commit `head_sha` and set its status to pending
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
my_check_run = github_repo.create_check_run("my-app-check", head_sha)
```

### Setting check run to success
The below example edits the check run and sets it to complete
```Python
# Set check run to complete
if my_check_run:
    my_check_run.edit(conclusion="success")
```