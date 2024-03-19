#!/bin/bash

# 가상 머신 IP 주소 목록
vm_ips=("192.168.10.11" "192.168.10.12" "192.168.10.13" "192.168.10.14")

# 가상 머신에 SSH로 로그인하는 사용자 이름
ssh_user="ansible"

# SSH 비밀번호 또는 인증 키 파일 경로
ssh_password="ansible"

# 가상 머신을 순회하며 종료 명령 실행
for ip in "${vm_ips[@]}"
do
    echo "Shutting down VM at $ip..."
    sshpass -p "$ssh_password" ssh -o StrictHostKeyChecking=no "$ssh_user"@"$ip" 'sudo shutdown -h now'
    # 또는 인증 키를 사용하는 경우:
    # ssh -i /path/to/ssh_key "$ssh_user"@"$ip" 'sudo shutdown -h now'
done

echo "종료 완료."
