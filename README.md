# test-puppeteer-examples

```shell
docker-compose up -d
docker-compose exec puppeteer-examples bash
```

```shell
mkdir /home/chromium
cd /home/chromium
bash /home/src/downloadChromium.sh 727972
ln -s ./727972/chrome-linux ./latest

cd /home/src
mkdir output
node lazyimages_without_scroll_events.js -u https://css-tricks.com/examples/LazyLoading/ -o output/result.html
```
