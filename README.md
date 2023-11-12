# OpenAI-Checker（简中汉化版）
一个用来检测你的IP是否可以访问OpenAI服务的脚本 \
原作者：[Vincent](https://github.com/missuo) 翻译：天神 \
Used to check if your IP can access OpenAI services.

> [!IMPORTANT]
> **由于OpenAI的策略变更，本脚本可能不再精确。（2023年5月29日）** \
> **With the update of OpenAI's strategy, this script may no longer be accurate. (May 29, 2023)**

## 检测方法
检测结果来自 **Cloudflare**，其准确性与本脚本无关 \
当前(2023-04-05)有163个国家/地区支持openAI，原作者仓库会及时更新最新的地区池。本fork仓库会尽可能跟上原作者的更新，如有不及时请见谅

## 使用方法
```shell
bash <(curl -Ls https://tian-shen.me/file/openai)
```
or
```shell
bash <(curl -Ls https://raw.githubusercontent.com/sahuidhsu/OpenAI-Checker-zh_CN/main/openai.sh)
```
## 结果示例
```
> bash <(curl -Ls https://raw.githubusercontent.com/sahuidhsu/OpenAI-Checker-zh_CN/main/openai.sh)
OpenAI访问检测脚本. 原作者：Vincent. 汉化：天神
源仓库：https://github.com/missuo/OpenAI-Checker
-------------------------------------
[IPv4]
您的IPv4地址: 114.514.191.98 网络提供商：Shimokitazawa Network
您的IP支持访问openAI. 地区码: JP
-------------------------------------
[IPv6]
您的IPv6地址: 7c10:0721:1551:8a11::1024 网络提供商：SoftBank Corp
您的IP支持访问openAI. 地区码: JP
-------------------------------------
```
## Thanks
- [Hill-98](https://github.com/Hill-98): Improved the Loc Code that can support access to OpenAI. [#1](https://github.com/missuo/OpenAI-Checker/issues/1)

## Author
**OpenAI-Checker** © [Vincent Young](https://github.com/missuo), Released under the [MIT](./LICENSE) License.<br>
