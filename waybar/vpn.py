import subprocess
output = subprocess.check_output(['sudo', 'adguardvpn-cli', 'status'])
if output[0] == 67:
    print(" 󰒘 ")
else:
    print(" 󰫜 ")
