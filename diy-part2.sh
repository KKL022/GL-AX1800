#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.8.1/g' package/base-files/files/bin/config_generate

# 修改主机名字，把 GL-AX1800 修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/OpenWrt/GL-AX1800/g' package/base-files/files/bin/config_generate

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-argon）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile

# ttyd 自动登录
sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

# luci-app-argon-config
sed -i 's/system/services/g'  package/luci-app-argon-config/luasrc/controller/argon-config.lua

# 调整VPN服务到VPN菜单
sed -i 's/status/vpn/g' feeds/luci/applications/luci-app-wireguard/luasrc/controller/wireguard.lua
sed -i 's/92/2/g' feeds/luci/applications/luci-app-wireguard/luasrc/controller/wireguard.lua

# 修改插件名字
sed -i 's/WireGuard 状态/WireGuard/g' feeds/luci/applications/luci-app-wireguard/po/zh-cn/wireguard.po