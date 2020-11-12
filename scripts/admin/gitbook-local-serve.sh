#!/usr/bin/env bash

rm -r _book/
book sm
sed -i "s/\/SUMMARY.md/#\/SUMMARY.md/g" .gitignore
gitbook serve
