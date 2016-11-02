Populate aws environment variables from gnome keyring. Use with the following alias:

```
function set_env
{
    eval $(set_aws_env.py $1)
}
alias setawsenv=set_env
```

