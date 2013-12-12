# 23andMe data exporter

[Api Login](https://api.23andme.com/user/login/?redirect=/apply/)

Also set the `redirect uri` to be `http://localhost:5000/auth/twenty_three_and_me/callback`


```
 export TWENTYTHREEANDME_KEY= <api-key>
 export TWENTYTHREEANDME_SECRET= <api-secret>
```


 ruby app.rb -p 5000

