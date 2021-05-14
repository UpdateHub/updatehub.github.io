# UpdateHub Documentation

This documentation is built with [MkDocs](http://www.mkdocs.org),
themed with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material)
and is hosted on [GitHub Pages](https://pages.github.com).

Generated documentation is available at: https://docs.updatehub.io

## Installation

Create a virtual environment (`venv` directory):

```
virtualenv venv
```

Install the required packages to build documentation:

```
./venv/bin/pip install -r requirements.txt
```

## Structure

*mkdocs.yml* - it is the configuration file: navigation structure, theme
definitions,personal informations, among others are here.If you add or
remove pages, change this file according according changes.

*docs* - this folder contains the pages contents of the documentation.

## Editing documentation

To edit the documentation, just edit the files inside `src`.

In order for content to show up, it needs to be added to the configuration,
i.e., in the `nav` section of the `mkdocs.yml` file.

Some pointers:

* [File layout](https://www.mkdocs.org/user-guide/writing-your-docs/#file-layout)
* [Writing with Markdown](https://www.mkdocs.org/user-guide/writing-your-docs/#writing-with-markdown)

## Previewing changes locally

You can test what the documentation looks like, using the following command
and opening a browser on [localhost:8000](http://127.0.0.1:8000):

```
./venv/bin/mkdocs serve
```

mkdocs monitors setup and markdown files, so you can just add and edit
them as you like, it will automatically rebuild and refresh the browser.
