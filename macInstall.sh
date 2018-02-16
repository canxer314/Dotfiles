#!/bin/bash

# 进入 iCloud 中的 AppList 文件夹
cd  ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/AppList/

# 生成 MAS_AppList 安装命令
cat ./MAS_AppList | sed "s/(.*)//g" | sed -Ee 's/([0-9]+) (.+)/mas install \1 #\2/g' > ./AppInstaller

# 生成 Brew_AppList 安装命令
echo "" >> ./AppInstaller
echo "brew install $(cat ./Brew_AppList | tr '\n' ' ')" >> AppInstaller

# 生成 BrewCask_AppList 安装命令
echo "" >> ./AppInstaller
echo "brew cask install $(cat ./BrewCask_AppList | tr '\n' ' ')" >> ./AppInstaller

# 开始安装
chmod +x ./AppInstaller
./AppInstaller
