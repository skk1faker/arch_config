#!/bin/bash
# 功能：显示当前 cron 任务数量，支持点击操作
TaskFile=~/configRepo/crontab/crontab.txt
case $1 in
    "show")
        count=$(crontab -l 2>/dev/null | wc -l)
        echo "${count:-0} tasks"  # 输出到 Polybar
        ;;
    "edit")
		gvim "$TaskFile" && crontab "$TaskFile"
        ;;
esac
