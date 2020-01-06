# GitHub Action to do `aws sync $FROM $TO`

This simple action uses the [AWS CLI](https://docs.aws.amazon.com/cli/index.html) to sync directory between github action work dir and aws s3.  
And it depends on [aws-actions/configure-aws-credentials](https://github.com/aws-actions/configure-aws-credentials)

## Usage

### `workflow.yml` Example

```
on: [push]

jobs:
  awesome:
    runs-on: ubuntu-latest
    name: do something awesome
    steps:
    - name: Configure AWS Credentials
      uses: aws-actions/configure-aws-credentials@v1
      with:
        aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws-region: ${{ secrets.AWS_REGION }}

    - name: sync dir from s3
      uses: leadinginfo/aws-cli-s3-sync-action@master
      with:
        from: s3://your-bucket/path/what/you/want # or from secrets
        to: local/path/what/you/want
...     
```

### Required Inputs Parameters

| Key | Value | Required |
| --- | ----- | ---------|
| `FROM` | The path you wish to sync from, maybe local or remote s3 | **Yes** |
| `TO` | The path you wish to sync to, maybe local or remote s3 | **Yes** |


