# CookieCutter Container

This project creates a Docker container for cookiecutter. This way cookiecutter can be used without the need to install
it locally outside a virtualenv.

## Usage

This project creates a cookiecutter container, which can then be use to cookie-cut a project template. This is tailored
to be used in combination with Jupyter books. For instance:

```bash
# Cookie cut a jupyter book locally to start working on it.
docker run -v .:/cookiecutter -it CHANGETHIS/cookiecutter/cookiecutter:latest https://github.com/executablebooks/cookiecutter-jupyter-book.git
```

Follow the interactive prompts to define your project. After this is finished:

- `cd` into your newly created project
- Create a Python virtual environment
- Install the packages listed in `requirements.txt`
- Build the html render of your book:

```bash
uv venv
.venv/bin/activate
. .venv/bin/activate
uv pip install -r requirements.txt
uv pip list
jupyter-book build my_book
```

- Create a Git repository for your Jupyter book, commit and push the changes:

```bash
git add .
git commit -m "first commit"
git remote add origin git@github.com:your-location/my_book.git
git push -u origin main
```

For GitHub pages, make sure to enable pages first. Go to Settings, Pages, select 'Actions' as a pages source.

## Contribute

Instructions on how to install and set up the project.

```bash
# Clone the repository
git clone https://gitlab.tue.nl/rdi-lab/images/cookiecutter.git

# Navigate to the project directory
cd cookiecutter
```

Use VSCode with the devcontainer defined in this project to contribute. This way, you don't have to install any dependencies
locally.
