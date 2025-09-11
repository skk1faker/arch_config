#!/bin/bash
# 获取当前输入法名称
# IM=$(fcitx5-remote -n)
# 获取中英文状态 (0=英文, 1=中文)

STATE=$(fcitx5-remote)

if [ "$STATE" -eq 1 ]; then
    # echo "EN|$IM"  # 中文状态显示
    printf "En"  # 中文状态显示
else
    # echo "CH|$IM"  # 英文状态显示
	printf "Ch"
fi
