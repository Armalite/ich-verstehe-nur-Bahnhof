# AWS VAULT

AWS Vault is a tool to securely store and access AWS credentials in a development environment by creating temp credentials based on the profiles setup in your AWS CLI profiles file in `~/.aws/profiles`. For macOS, AWS Vault uses the macOS keychain to store temporary credentials. Running assume role commands via AWS Vault can therefore sometimes request for your keychain password.

The temporary credentials that are created (which AWS vault does by using AWS cli STS assumerole commands) are only kept for a short period of time (1 hour), after which it will request new temporary creds when running aws-vault exec.

## Install
There are various methods of installation as documented on their git repo: https://github.com/99designs/aws-vault
My preference was to install directly using Homebrew on macOS: `brew install aws-vault`

## AWS profile
This is an example, similar to what my `~/.aws/config` looks like that relies on MFA auth based on a default profile and various role assumptions:

```
[default]
region = us-east-1
output = json
mfa_serial = arn:aws:iam::000000000000:mfa/adeeb@beautiful.com

[profile beautiful-data-platforms-prod]
role_arn = arn:aws:iam::123456789123:role/Developer
source_profile = default
region = us-east-1
mfa_serial = arn:aws:iam::000000000000:mfa/adeeb@beautiful.com
role_session_name = ProdDataPlatformDevSession

[profile beautiful-data-platforms-uat]
role_arn = arn:aws:iam::234567891234:role/Developer
source_profile = default
region = us-west-2
mfa_serial = arn:aws:iam::000000000000:mfa/adeeb@beautiful.com

[profile beautiful-data-platforms-test]
role_arn = arn:aws:iam::345678912345:role/Developer
source_profile = default
region = ap-southeast-2
mfa_serial = arn:aws:iam::000000000000:mfa/adeeb@beautiful.com

[profile beautiful-bi-uat]
role_arn = arn:aws:iam::567891234567:role/Developer
source_profile = default
region = ap-southeast-2
mfa_serial = arn:aws:iam::000000000000:mfa/adeeb@beautiful.com

[profile beautiful-some-account-prod]
role_arn = arn:aws:iam::678912345678:role/Developer
source_profile = default
region = us-east-1
mfa_serial = arn:aws:iam::000000000000:mfa/adeeb@beautiful.com

[profile beautiful-some-account-uat]
role_arn = arn:aws:iam::789123456789:role/Developer
source_profile = default
region = us-west-2
mfa_serial = arn:aws:iam::000000000000:mfa/adeeb@beautiful.com

[profile beautiful-some-account-test]
role_arn = arn:aws:iam::891234567891:role/Developer
source_profile = default
region = ap-southeast-2
mfa_serial = arn:aws:iam::000000000000:mfa/adeeb@beautiful.com

```

## Assuming Role
Using the example AWS config from the previous section, I can assume any of those roles based on the profile name, e.g.: `aws-vault exec beautiful-data-platforms-test`
Once the temporary credentials expire, it is worth unsetting the environment variable AWS_VAULT with `unset AWS_VAULT` before running `aws-vault exec ...` again.
Alternatively you can always set up aliases to shorten some of these commands or combine them.

## Adding more profiles/accounts
You can do this directly by editing the ~/.aws/config OR you can use the built in aws-vault command: `aws-vault add <profile>`

## Quality of life aliases
### Short aws-vault exec
Shortening the overall `aws-vault exec` command with the following alias: `alias ae="aws-vault exec" >> .bashrc`
Usage: `ae beautiful-data-platforms-test`

# Run AWS CLI command as a profile
You can run AWS cli commands AS a particular role. This can be added to bash scripts, Make files etc.
```bash
aws-vault exec <profile> -- aws s3 ls
```

# View list of creds in your credentials vault
You can run the following command to see a list of AWS profiles/accounts and credentials added to your keychain/vault: `aws-vault list`
