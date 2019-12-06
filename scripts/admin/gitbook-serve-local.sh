#!/bin/sh

echo "Gitbook installation-guides..."
rm -r _book/
# npm install -g gitbook-summary
node /usr/local/bin/book sm -i CONTRIBUTING # Overrides '.*, /_book/', but /_book/ was erased above
# npm install -g gitbook
sed -i "s/\/SUMMARY.md/#\/SUMMARY.md/g" .gitignore
gitbook serve
