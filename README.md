# cml-breakout-for-ansible
This allows you to use ansible to configure things without ssh/network first.
This is very rudimentary and should really only be used to get ssh and network connectivity running.

## Install
1. Download and extract this repo
2. Change directory into the folder
3. Download breakout-linux-amd64 and put that in the working directory
4. Build docker image
'''
$ sudo docker build -t ssh-telnet-container .
'''
5. Start docker image
'''
$ sudo docker run -d -p 2222:22 -p 8080:8080 --name ssh-telnet ssh-telnet-container
'''

## Recomendations
- You may want to change the passwords for the user accounts.
- If you have more than 20 nodes you will need to increase the amount of user accounts in createusers.sh
- If all the devices are stuck in configuration mode run the script end.sh

## Extra
I have also created an Ansible inventory file that you may use hosts.yaml
