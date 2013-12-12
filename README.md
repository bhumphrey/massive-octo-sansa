
# 23andMe data exporter


# Setup

## Signup 
[Api Login](https://api.23andme.com/user/login/?redirect=/apply/)

Also set the `redirect uri` to be `http://localhost:5000/auth/twenty_three_and_me/callback`


## Configure
```
 export TWENTYTHREEANDME_KEY= <api-key>
 export TWENTYTHREEANDME_SECRET= <api-secret>
```


# Running
 ruby app.rb -p 5000

