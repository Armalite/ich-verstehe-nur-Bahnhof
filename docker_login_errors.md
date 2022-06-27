# Docker Login Errors and Fixes


### Error saving credentials - err: exit status 1, out: 'not implemented'
Have encountered this error when attempting to do a docker login to a docker hub or artifactory repo via:
```bash
echo $(repo_pass) | docker login -u repo_user --password-stdin myrepo-docker.artifactory.my-domain.com
```

To resolve the error I had to rename/remove the following config file: `~/.docker/config.json` 

To rename: `mv ~/.docker/config.json ~/.docker/config_backup.json`

After doing this, run your `docker login` command again and it should work