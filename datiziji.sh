#!/bin/bash

dati1=cddh
dati2=zscr
dati3=xigua
dati4=huajiao

dati=$dati1

while true
do
		timu_html=`curl -s -X GET http://140.143.49.31/api/ans2?key=$dati\&wdcallback=jQuery1124023602575832046568_1516879930439\&_=1516879931331 -H "User-Agent: Mozilla/5.0 (Linux; Android 4.4.2; SM-G955N Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Mobile Safari/537.36 SogouSearch Android1.0 version3.0 AppVersion/5909" -H "Referer: http://nb.sa.sogou.com/" -H "Connection: keep-alive" -H "Accept-Encoding: gzip,deflate" -H "Accept-Language: zh-CN,en-US;q=0.8" -H "X-Requested-With: com.sogou.activity.src"`
		#过滤斜杠,添加换行
		timu_txt=`echo "$timu_html" | sed 's/\\\//g' | sed "s/\"answers\"/\n\"answers\"/g"`
		#题目,取第18个冒号处，第2个双引号处，第三列即最后一个结果
		#timu=`echo "$timu_txt" | cut -f18 -d":" | cut -f2 -d"\"" | sed -n "3,1p"`		#芝士18，西瓜18
		timu=`echo "$timu_txt" | cut -f17 -d":" | cut -f2 -d"\"" | sed -n "3,1p"`		#冲顶17，花椒17
		#选项
		timu_choices=`echo "$timu_txt" | cut -f2 -d":" | cut -f1 -d"]" | sed "s/\[//g" | sed "s/\"//g" | sed -n "3,1p"`
		#答案
		answers=`echo "$timu_txt" | cut -f11 -d":" | cut -f2 -d"\"" | sed -n "3,1p"`
		#echo $timu_txt
		echo "---------------------"
		echo "题目："$timu
		echo "选项："$timu_choices
		echo "答案： $answers"
		cankao_html=`curl -s -X GET http://www.baidu.com/s?wd="$timu"`
		#echo $cankao_html
		echo "参考："
		#取内容
		#并去除换行,再去掉前面和后面无关的内容
		cankao_content=`echo $cankao_html | tr '\n' ' ' | tr '\r' ' ' | sed "s/.*百度为您//g" | sed "s/相关搜索.*//g" | sed "s/container/\r\ncontainer/g" | sed "s/<[^>]*>//g" | sed "s/bds.*//g" | sed "s/.*>//g" | sed "s/http[^\r\n]*//g" | sed "s/\.\.\.[^\r\n]*//g" | sed "s/.*日//g" | sed "s/.*;//g" | sed "s/\s*//g" | sed "s/.*结果约[0-9]*,[0-9]*个//g"`
		#echo $cankao_content > 3.txt
		echo $cankao_content
#       sleep 1
done
