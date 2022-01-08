# PyGit2 Clone Repository

Cloning a git repository with PyGit2, via https + access token (i.e. use x-oauth-basic):
```Python
git_token = "your access token"
git_repo_path = "Repository path"
git_repo_url = (
    f"https://{git_token}:x-oauth-basic@github.com/{git_repo_path}"
)
cloned_repo = pygit2.clone_repository(git_repo_url, "path/to/clone/to")
```

To checkout a specific branch after cloning:
```Python
git_token = "your access token"
git_repo_path = "Repository path"
git_repo_url = (
    f"https://{git_token}:x-oauth-basic@github.com/{git_repo_path}"
)
cloned_repo = pygit2.clone_repository(git_repo_url, "path/to/clone/to")
branch_name="uat"
branch_name=f"origin/{branch}"
branch_origin=cloned_repo.branches[branch_name]
branch_ref=cloned_repo.lookup_reference(branch_origin.name)
cloned_repo.checkout(branch_ref)
```
