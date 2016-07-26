#!/bin/bash
# AUTHOR:   Robert Morouney and Michael Roher (only Excel version)
# EMAIL:    robert@morouney.com
# FILE:     update_stats.sh
# CREATED:  2016-07-07 18:31:30
# MODIFIED: 2016-07-07 19:26:16

echo 'UPDATEING STATS.......'
# stdout version
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all >rev_hist_master.out
echo './rev_hist.out Updated'

#Text Version
git log --graph --oneline --decorate --date=relative --all >rev_hist_master.txt
echo './rev_hist.txt Updated'

#HTML Version
git log --all --date=relative --pretty=format:'<a href="http://github.com/UPOD-2016/UPOD/commit/%H"><b>%aD</b></a><br/><li><i> %s</i> -<b>%an</b> </li><br/> ' >rev_hist.html 
echo './rev_hist.html Updated'

#short log
git shortlog -s -n >rev_hist_short.txt
echo './rev_hist_short.txt Updated'

#Excel version
git log --date=iso --pretty=format:'"%an","%ad","%s"' > rev_hist.csv
echo './rev_hist_excel Updated'
