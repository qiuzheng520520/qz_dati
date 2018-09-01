#!/bin/bash

dati1=zscr
dati2=cddh
dati3=xigua
dati4=huajiao

dati=$dati1

while true
do
	curl -s -X GET http://140.143.49.31/api/ans2?key=$dati\&wdcallback=jQuery1124023602575832046568_1516879930439\&_=1516879931331 -H "User-Agent: Mozilla/5.0 (Linux; Android 4.4.2; SM-G955N Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Mobile Safari/537.36 SogouSearch Android1.0 version3.0 AppVersion/5909" -H "Referer: http://nb.sa.sogou.com/" -H "Connection: keep-alive" -H "Accept-Encoding: gzip,deflate" -H "Accept-Language: zh-CN,en-US;q=0.8" -H "X-Requested-With: com.sogou.activity.src" | sed "s/\\\//g" | sed "s/\"answers\"/\n\"answers\"/g" | cut -f11,13 -d":" | cut -f2,5,6 -d"\"" | sed -n "3,1p"
#	sleep 1
done
