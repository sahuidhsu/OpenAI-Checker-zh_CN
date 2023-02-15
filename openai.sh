#!/bin/bash
###
 # @Author: Vincent Young
 # @Translation: LTY_CK_TS
 # @Date: UTC+8 2023-02-09 17:39:59
 # @LastEditors: Vincent Young
 # @LastEditTime: 2023-02-15 20:54:40
 # @FilePath: /OpenAI-Checker-zh_CN/openai.sh
 # @Telegram: https://t.me/missuo
 # 
 # Copyright © 2023 by Vincent, All Rights Reserved. 
### 

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
PLAIN='\033[0m'
BLUE="\033[36m"

SUPPORT_COUNTRY=(AL DZ AD AO AG AR AM AU AT AZ BS BD BB BE BZ BJ BT BA BW BR BG BF CV CA CL CO KM CR HR CY DK DJ DM DO EC SV EE FJ FI FR GA GM GE DE GH GR GD GT GN GW GY HT HN HU IS IN ID IQ IE IL IT JM JP JO KZ KE KI KW KG LV LB LS LR LI LT LU MG MW MY MV ML MT MH MR MU MX MC MN ME MA MZ MM NA NR NP NL NZ NI NE NG MK NO OM PK PW PA PG PE PH PL PT QA RO RW KN LC VC WS SM ST SN RS SC SL SG SK SI SB ZA ES LK SR SE CH TH TG TO TT TN TR TV UG AE US UY VU ZM BO BN CG CZ VA FM MD PS KR TW TZ TL GB)
echo -e "${BLUE}OpenAI访问检测脚本. ${YELLOW}原作者：Vincent. ${GREEN}汉化：天神${PLAIN}"
echo -e "源仓库：${BLUE}https://github.com/missuo/OpenAI-Checker${PLAIN}"
echo "-------------------------------------"
if [[ $(curl -sS https://chat.openai.com/ -I | grep "text/plain") != "" ]]
then
	echo "您的IP被openAI防火墙封禁！"
else
	echo -e "[IPv4]"
	check4=`ping 1.1.1.1 -c 1 2>&1`;
	if [[ "$check4" != *"received"* ]] && [[ "$check4" != *"transmitted"* ]];then
		echo -e "\033[34m当前主机无IPV4，跳过测试\033[0m";
	else
		# local_ipv4=$(curl -4 -s --max-time 10 api64.ipify.org)
		local_ipv4=$(curl -4 -sS https://chat.openai.com/cdn-cgi/trace | grep "ip=" | awk -F= '{print $2}')
		local_isp4=$(curl -s -4 --max-time 10  --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36" "https://api.ip.sb/geoip/${local_ipv4}" | grep organization | cut -f4 -d '"')
		#local_asn4=$(curl -s -4 --max-time 10  --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36" "https://api.ip.sb/geoip/${local_ipv4}" | grep asn | cut -f8 -d ',' | cut -f2 -d ':')
		echo -e "${BLUE}您的IPv4地址: ${local_ipv4} ${PLAIN}网络提供商：${local_isp4}"
		iso2_code4=$(curl -4 -sS https://chat.openai.com/cdn-cgi/trace | grep "loc=" | awk -F= '{print $2}')
		if [[ "${SUPPORT_COUNTRY[@]}"  =~ "${iso2_code4}" ]];
		then
			echo -e "${GREEN}您的IP支持访问openAI. 地区码: ${iso2_code4}${PLAIN}"
		else
			echo -e "${RED}您的地区码: ${iso2_code4}. 当前不支持使用openAI.${PLAIN}"
		fi
	fi
	echo "-------------------------------------"
	echo -e "[IPv6]"
	check6=`ping6 240c::6666 -c 1 2>&1`;
	if [[ "$check6" != *"received"* ]] && [[ "$check6" != *"transmitted"* ]];then
		echo -e "\033[34m当前主机无IPV6，跳过测试\033[0m";
	else
		# local_ipv6=$(curl -6 -s --max-time 20 api64.ipify.org)
		local_ipv6=$(curl -6 -sS https://chat.openai.com/cdn-cgi/trace | grep "ip=" | awk -F= '{print $2}')
		local_isp6=$(curl -s -6 --max-time 10 --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36" "https://api.ip.sb/geoip/${local_ipv6}" | grep organization | cut -f4 -d '"')
		#local_asn6=$(curl -s -6 --max-time 10  --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36" "https://api.ip.sb/geoip/${local_ipv6}" | grep asn | cut -f8 -d ',' | cut -f2 -d ':')
		echo -e "${BLUE}您的IPv6地址: ${local_ipv6} ${PLAIN}网络提供商：${local_isp6}"
		iso2_code6=$(curl -6 -sS https://chat.openai.com/cdn-cgi/trace | grep "loc=" | awk -F= '{print $2}')
		if [[ "${SUPPORT_COUNTRY[@]}"  =~ "${iso2_code6}" ]];
		then
			echo -e "${GREEN}您的IP支持访问openAI. 地区码: ${iso2_code6}${PLAIN}"
		else
			echo -e "${RED}您的地区码: ${iso2_code6}. 当前不支持使用openAI.${PLAIN}"
		fi
	fi
	echo "-------------------------------------"
fi
