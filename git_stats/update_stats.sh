#!/bin/bash
# AUTHOR:   Robert Morouney
# EMAIL:    robert@morouney.com 
# FILE:     update_stats.sh
# CREATED:  2016-07-07 18:31:30
# MODIFIED: 2016-07-07 18:34:29

echo 'UPDATEING STATS.......'
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all >rev_hist_master.txt
echo './rev_hist_master.txt Updated'

