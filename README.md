[![roboticslab-uc3m logo](assets/roboticslab-banner-350px.png)](https://github.com/roboticslab-uc3m)

# Installation Guides

Installation Guides @ [roboticslab-uc3m](https://github.com/roboticslab-uc3m)

Currently hosted at https://roboticslab-uc3m.github.io/installation-guides/

## If you have any doubts or comments
Please read the Developer Manual's [Asking Questions](http://robots.uc3m.es/gitbook-developer-manual/asking-questions.html) section, and once you've succeded with its [self-evaluation](http://robots.uc3m.es/gitbook-developer-manual/asking-questions.html#self-evaluation-time) follow the recommendations by commenting publicly [HERE](https://github.com/roboticslab-uc3m/installation-guides/issues/new) if required

## How-To's
* [How to serve on localhost](#how-to-serve-on-localhost)
* [How to upload changes to GitHub](#how-to-upload-changes-to-github)

### How to serve on localhost
It is useful to serve on `localhost` to modify the website and see changes locally.

**Note**: This specific repository is different, it uses a `SUMMARY.md` that is auto-generated via [scripts/admin/update-gitbook.sh](scripts/admin/update-gitbook.sh). For general guides refer to [install-gitbook](install-gitbook.md#to-be-able-to-serve-via-gitbook-legacy).

1. Make sure you have installed [gitbook-summary](install-gitbook.md#gitbook-summary).

1. To serve, from the root of the project, run: [./scripts/admin/gitbook-local-serve.sh](scripts/admin/gitbook-local-serve.sh)

1. You can now browse the site at the default location: http://127.0.0.1:4000

1. To clean, (recover `.gitignore` to its previous state, remove generated `SUMMARY.md`), run: [./scripts/admin/gitbook-local-clean.sh](scripts/admin/gitbook-local-clean.sh)

### How to upload changes to GitHub
This project is managed as any project on [GitHub](https://www.github.com). You may use [Git](https://git-scm.com) or even the GitHub web interface, both on which you can find many tutorials online. The following points are specific to the [Gitbook (legacy)](https://github.com/asrob-uc3m/actas/issues/148#issuecomment-449748350) mechanism used:

1. Please **do not upload** the `_book/` folder. It is auto-generated locally, and the same should happen on the Gitbook (legacy) servers. For this repository, **do not upload** the `SUMMARY.md` file.

2. It is safe to `git push` to any upstream branch, just remember that what is on `master` is what will be actually rendered as the website.
