[![roboticslab-uc3m logo](docs/assets/roboticslab-banner-350px.png)](https://github.com/roboticslab-uc3m)

# Installation Guides

Installation Guides @ [roboticslab-uc3m](https://github.com/roboticslab-uc3m)

Currently hosted at https://robots.uc3m.es/installation-guides/

## If you have any doubts or comments

Please read the Developer Manual's [Asking Questions](https://robots.uc3m.es/developer-manual/asking-questions.html) section, and once you've succeded with its [self-evaluation](https://robots.uc3m.es/developer-manual/asking-questions.html#self-evaluation-time) follow the recommendations by commenting publicly [HERE](https://github.com/roboticslab-uc3m/installation-guides/issues/new) if required

## How-To's

* [How to serve on localhost](#how-to-serve-on-localhost)
* [How to upload changes to GitHub](#how-to-upload-changes-to-github)

### How to serve on localhost

It is useful to serve on `localhost` to modify the website and see changes locally.

1. From the root of the project, run the following command:

   ```bash
   pip install -r requirements.txt
   mkdocs serve
   ```

1. You can now browse the site at the default location: <http://127.0.0.1:8000>

### How to upload changes to GitHub

This project is managed as any project on [GitHub](https://www.github.com). You may use [Git](https://git-scm.com) or even the GitHub web interface, both on which you can find many tutorials online. The following points are specific to the MkDocs mechanism used:

1. Please **do not upload** the `site/` folder. It is auto-generated locally, and the same should happen on the MkDocs servers.

1. It is safe to `git push` to any upstream branch, just remember that what is on `master` is what will be actually rendered as the website.
