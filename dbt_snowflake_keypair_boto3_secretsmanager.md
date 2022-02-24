# DBT + Snowflake Key Pair + Boto3 + Secrets Manager
DBT supports the use of Snowflake key pair authentication. You can set up your dbt profile to accept key pairs as per the examples below. Using AWS secrets manager is a good way to store the private key that you can retrieve from your deployment / transformation pipelines securely at runtime. SecretsManager allows you to store the private key as a SecretString or a SecretBinary. This doc will cover how to fetch these secrets using python and make them usable by your dbt profile.

## DBT Profile
You can setup your DBT profile to accept Snowflake private key for auth by replacing the password field with a `private_key_path` field in your profiles.yml file.

Example:
```yaml
default:
  outputs:
    target_that_uses_key:
      type: snowflake
      account: xero.us-east-1

      user: YOUR_SNOWFLAKE_USERNAME
      # path to the private key. This example indicates the key is in a file called private.key in the current dir
      private_key_path: "private.key"

      role: YOUR_SNOWFLAKE_ROLE
      database: YOUR_SNOWFLAKE_DB
      warehouse: YOUR_SNOWFLAKE_WH

      schema: "YOUR_SNOWFLAKE_SCHEMA"
      threads: 4

  target: "target_that_uses_key"
```

## Fetch Secret
You can use Python's boto3 library to interact with AWS resources. If you have stored your private key within a AWS Secrets Manager secret, you can fetch the secret value using the boto3 library. Here we will show you how to deal with a private key stored in a SecretBinary secret in AWS Secrets Manager. You can achieve much of this within a single line, but it steps such as base encoding is separated out for readibility

```python
import boto3

# Create boto3 client
secretclient = boto3.client("secretsmanager", region_name="us-east-1")

# Fetch the secret value paylodd
secret_content = secretclient.get_secret_value(SecretId=f'<your secret arn>')

# Fetch the binary contents of the secret
secret_binary_content = secret_content["SecretBinary"]   

# Boto3 base64 decodes SecretBinary's from secrets manager.
# This step reencodes it
secret_binary_content_b64 = base64.b64encode(secret_binary_content)

# Convert encoded private key to text
private_key_raw = secret_binary_content_b64.decode('utf-8')

# Create a pem key file structure with the BEGIN And END prefixes
private_key_pem_file_content = '''-----BEGIN PRIVATE KEY-----\n''' + private_key_raw + '''\n-----END PRIVATE KEY-----'''

with open(f'private.key', 'w') as f:
    f.write(private_key_pem_file_content)

```


Short version of the pem file generation:
```python
private_key_content = '''-----BEGIN PRIVATE KEY-----\n''' + \
              base64.b64encode(secret_content["SecretBinary"]).decode('utf-8') + '''\n-----END PRIVATE KEY-----'''
```
