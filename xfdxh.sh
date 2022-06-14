#!/bin/bash
function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
rm -rf $localdir
}

function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}

git clone https://github.com/zzsj0928/luci-app-pushbot ./luci-app-pushbot
git clone https://github.com/tty228/luci-app-serverchan ./luci-app-serverchan
git clone https://github.com/ntlf9t/luci-app-easymesh ./luci-app-easymesh
git clone https://github.com/yaof2/luci-app-ikoolproxy ./luci-app-ikoolproxy
rm -rf ./luci-app-ikoolproxy/.github       
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-kodexplorer ./luci-app-kodexplorer
        
svn export https://github.com/lisaac/luci-lib-docker/trunk/collections/luci-lib-docker ./lisaac/luci-lib-docker
svn export https://github.com/lisaac/luci-app-diskman/trunk/applications/luci-app-diskman ./lisaac/luci-app-diskman
svn export https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman ./lisaac/luci-app-dockerman
        
svn export https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto ./linkease/luci-app-ddnsto
svn export https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-linkease ./linkease/luci-app-linkease
svn export https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-quickstart ./linkease/luci-app-quickstart
svn export https://github.com/linkease/nas-packages/trunk/network/services/ddnsto ./linkease/ddnsto
svn export https://github.com/linkease/nas-packages/trunk/network/services/linkease ./linkease/linkease
 svn export https://github.com/linkease/nas-packages/trunk/network/services/quickstart ./linkease/quickstart
svn export https://github.com/linkease/istore/trunk/luci/luci-app-store ./linkease/luci-app-store
svn export https://github.com/linkease/istore-ui/trunk/app-store-ui ./linkease/app-store-ui
svn export https://github.com/jjm2473/openwrt-apps/trunk/luci-app-ota ./linkease/luci-app-ota 
              
git clone https://github.com/jerrykuku/luci-app-vssr ./jerrykuku/luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb ./jerrykuku/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus ./jerrykuku/luci-app-jd-dailybonus
git clone https://github.com/jerrykuku/luci-theme-argon ./jerrykuku/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon -b 18.06 ./jerrykuku/luci-theme-argon-18.06
git clone https://github.com/jerrykuku/luci-app-argon-config ./jerrykuku/luci-app-argon-config

git clone https://github.com/destan19/OpenAppFilter ./op-oaf
                             
svn export https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom/trunk/luci-theme-infinityfreedom ./theme-18.06/luci-theme-infinityfreedom
git clone https://github.com/kiddin9/luci-theme-edge -b 18.06 ./theme-18.06/luci-theme-edge 
git clone https://github.com/xiangfeidexiaohuo/luci-theme-neobird ./theme-18.06/luci-theme-neobird
                         
svn export https://github.com/kiddin9/openwrt-packages/trunk/filebrowser ./op-fileBrowser/filebrowser
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-filebrowser ./op-fileBrowser/luci-app-filebrowser
        
svn export https://github.com/messense/aliyundrive-webdav/trunk/openwrt/aliyundrive-webdav ./op-aliyun/aliyundrive-webdav
svn export https://github.com/messense/aliyundrive-webdav/trunk/openwrt/luci-app-aliyundrive-webdav ./op-aliyun/luci-app-aliyundrive-webdav
svn export https://github.com/messense/aliyundrive-fuse/trunk/openwrt/aliyundrive-fuse ./op-aliyun/aliyundrive-fuse
svn export https://github.com/messense/aliyundrive-fuse/trunk/openwrt/luci-app-aliyundrive-fuse ./op-aliyun/luci-app-aliyundrive-fuse

        
git clone https://github.com/xiaorouji/openwrt-passwall ./patch/wall
rm -rf ./patch/wall/.github
svn export https://github.com/coolsnowwolf/packages/trunk/net/redsocks2 ./patch/wall/redsocks2
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall ./patch/wall-luci/luci-app-passwall
## svn export https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus ./patch/wall-luci/luci-app-ssr-plus
svn export https://github.com/kiddin9/openwrt-bypass/trunk/luci-app-bypass ./patch/wall-luci/luci-app-bypass
svn checkout https://github.com/vernesong/OpenClash/branches/dev/luci-app-openclash ./patch/wall-luci/luci-app-openclash
        
svn export https://github.com/coolsnowwolf/packages/trunk/net/socat ./op-socat/socat
git clone https://github.com/sbwml/luci-app-mosdns ./op-mosdns/
git clone https://github.com/sbwml/openwrt-alist ./op-alist/
rm -rf ./op-alist/.github

rm -rf ./jerrykuku/.github
        

sed -i \
-e 's?include \.\./\.\./\(lang\|devel\)?include $(TOPDIR)/feeds/packages/\1?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
*/Makefile

rm -rf ./*/.git & rm -f ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore

exit 0
