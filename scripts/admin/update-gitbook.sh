#!/usr/bin/env bash

# Thanks: http://stackoverflow.com/questions/14710257/running-a-cron-job-at-230-am-every-day
# On how to automate process at 2:30 every day (type "date" to get your server time)
# crontab -e
# 30 2 * * * /your/command

echo "Update installation-guides..."
cd $HOME/installation-guides
git pull
echo "Gitbook installation-guides..."
rm -r _book/
# npm install -g gitbook-summary
/usr/local/bin/node /usr/local/bin/book sm -i CONTRIBUTING # Overrides '.*, /_book/', but /_book/ was erased above
# npm install -g gitbook
sed -i "s/\/SUMMARY.md/#\/SUMMARY.md/g" .gitignore
/usr/local/bin/node /usr/local/bin/gitbook build
/usr/local/bin/node /usr/local/bin/gitbook pdf . _book/installation-guides.pdf
/usr/local/bin/node /usr/local/bin/gitbook mobi . _book/installation-guides.mobi
/usr/local/bin/node /usr/local/bin/gitbook epub . _book/installation-guides.epub
sed -i "s/#\/SUMMARY.md/\/SUMMARY.md/g" .gitignore
rm SUMMARY.md
cd ..
