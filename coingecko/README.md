## Coingecko Candy Bot
A bot that aims to claim daily candy automatically.


### download `candy.sh` into any directory

### update the cookie
you can find the cookie in the chrome `Dev Tools | Networks` by inspecting any request to `https://www.coingecko.com`.

   ![image](https://user-images.githubusercontent.com/3824034/123220564-a9c66580-d500-11eb-9e74-0167cd16a4ee.png)
  ```
CANDY_COOKIE='cookie: xxxxxx'
  ```
### install crontab 


### setup crontab to run `candy.sh` every 30 minutes
Edit crontab config
```
crontab -e
```
Add `*/30 * * * * bash ~/candy.sh` into it and save. Replace `~/candy.sh` to the location of script