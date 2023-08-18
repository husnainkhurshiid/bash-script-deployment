#!/bin/bash

# Remote server details
remote_user=<remote_user>
remote_host=<remote_host>
remote_password=<remote_password>

# SSH into the remote server and execute commands
sshpass -p "$remote_password" ssh -T -o StrictHostKeyChecking=no "$remote_user"@"$remote_host" << EOF
  # Change directory to "<ProjectFolder>"
  cd <ProjectFolder>

  # Pull the latest code from GitHub
  git remote set-url origin git@github.com:<username>/<ProjectFolder>.git
  git pull origin master

  # Run Docker Compose restart
  docker compose up --build -d

EOF
