
ip_services=(
	"https://ipinfo.io/ip"
	"https://ifconfig.me/ip"
	"https://api.ipify.org"
	"https://icanhazip.com"
)

# 尝试获取公网IP（最多重试3次）
ip_public=""
attempts=0
max_attempts=3

while [[ -z "$ip_public" && $attempts -lt $max_attempts ]]; do
	# 随机选择一个服务
	service=${ip_services[$RANDOM % ${#ip_services[@]}]}
		response=$(curl -4s --connect-timeout 5 "$service" | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}')

	# 验证IP格式有效性
	if [[ $response =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
		ip_public=$response
		break
	else
		((attempts++))
		# sleep 2  # 失败后延迟重试
	fi
done
echo $ip_public
