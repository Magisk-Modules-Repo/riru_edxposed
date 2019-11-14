# EdXposed

## Introduction

EdXposed is a Magisk & [Riru](https://github.com/RikkaApps/Riru) module that provides Xposed framework on Android devices running Android Oreo(8.x) or Android Pie(9.0).

## Differences between EdXposed and Xposed

- EdXposed supports Android Pie and Q.
- EdXposed have a built-in black/white list mode, with which you can choose apps you don't want to hook into and vice versa.
- EdXposed provides a so called instant modules mode(not recommended for normal users), which makes debugging and testing of modules more convenient and efficient.
- EdXposed can pass SafetyNet checking on most devices.

## Differences between Yahfa variant and SandHook variant

- The only difference is the underlying ART hooking framework: Yahfa variant uses [Yahfa](https://github.com/rk700/YAHFA) while SandHook variant uses [SandHook](https://github.com/ganyao114/SandHook)

### Which one to use

- Just try them out and choose the stabler and smoother one for yourself.

## Usage

1. Install [Magisk](https://github.com/topjohnwu/Magisk/releases).
2. Install [Riru-core](https://github.com/RikkaApps/Riru/releases) in Magisk Manager or Recovery mode.
2. Install [EdXposed](https://github.com/ElderDrivers/EdXposed/releases) in Magisk Manager or Recovery mode.
3. Install [EdXposed Manager](https://github.com/ElderDrivers/EdXposedManager/releases).

## Get help

GitHub issues: [Github Issues](https://github.com/solohsu/EdXposed/issues/)

Notice(for Chinese): 鉴于部分用户提交的Issues质量过低，对于中文用户反馈，请先阅读[EdXposed错误提交说明_cn](https://raw.githubusercontent.com/ElderDrivers/Repository-Website/gh-pages/repo/EdXposedIssuesReport_cn.txt)(不看说明提交的Issue会有很大可能被close)

## Community

- QQ Group: [855219808](http://shang.qq.com/wpa/qunwpa?idkey=fae42a3dba9dc758caf63e971be2564e67bf7edd751a2ff1c750478b0ad1ca3f)
- Telegram: [Code_of_MeowCat](http://t.me/Code_of_MeowCat)
- Discord (not recommended): [Code_of_MeowCat](https://discord.gg/Hag6gNh)

Notice: These community group don't accept any bug report, please use [Get help](#get-help) to report.
