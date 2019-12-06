#!/usr/bin/env bash

rm -r _book/
book sm -i CONTRIBUTING
sed -i "s/\/SUMMARY.md/#\/SUMMARY.md/g" .gitignore
gitbook serve
