#!/bin/sh

# Thanks: http://stackoverflow.com/questions/14710257/running-a-cron-job-at-230-am-every-day
# On how to automate process at 2:30 every day (type "date" to get your server time)
# crontab -e
# 30 2 * * * /your/command

echo "Update installation-guides..."
cd $HOME/installation-guides
git pull
echo "Gitbook installation-guides..."
rm -r _book/
/usr/local/bin/node /usr/local/bin/gitbook build
/usr/local/bin/node /usr/local/bin/gitbook pdf . _book/installation-guides.pdf
/usr/local/bin/node /usr/local/bin/gitbook mobi . _book/installation-guides.mobi
/usr/local/bin/node /usr/local/bin/gitbook epub . _book/installation-guides.epub
cd ..
