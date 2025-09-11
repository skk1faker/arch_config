#!/bin/bash
# 检测 Polybar 进程是否存在
if pgrep -x "polybar" > /dev/null; then
    # 若正在运行，则杀死所有 Polybar 进程
    killall -q polybar
else
    # 若未运行，则启动 Polybar（假设启动脚本为 launch.sh）
    ~/.config/polybar/launch.sh
fi
