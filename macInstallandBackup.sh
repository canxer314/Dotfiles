#!/bin/bash

# ================================= Mac App Install ==============================
echo "Start to install mac's apps"
# 进入 iCloud 中的 AppList 文件夹
cd  ~/Dropbox/AppList/

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

echo ""
echo "=============== Finish installing mac's apps ==============="


# ================================= Mac App Uninstall ==============================
# Uninstall unused apps
brew cask uninstall xquartz eclipse-jee --force


# ================================= Mac App Backup ==============================
echo ""
echo "=============== Start to backup mac's app ==============="
# All Apps
ls -lh /Applications > ~/Dropbox/AppList/All_AppList

# MAS Apps
/usr/local/bin/mas list > ~/Dropbox/AppList/MAS_AppList

# brew Apps
/usr/local/bin/brew list > ~/Dropbox/AppList/Brew_AppList

# brew cask Apps
/usr/local/bin/brew cask list > ~/Dropbox/AppList/BrewCask_AppList

echo ""
echo "=============== Finish backup mac's app ==============="