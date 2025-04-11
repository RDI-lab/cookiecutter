# CookieCutter Container

This project creates a Docker container for cookiecutter. This way cookiecutter can be used without the need to install
it locally outside a virtualenv.

> This project is based on [Cookiecutter](https://github.com/cookiecutter/cookecutter/).

## Usage of the container

This project creates a cookiecutter container, which can then be use to cookie-cut a project template. This is tailored
to be used in combination with Jupyter books. For instance:

```bash
$ docker run -v .:/cookiecutter -it ghcr.io/rdi-lab/cookiecutter:latest https://github.com/RDI-lab/cookiecutter-jupyter-book.git
```

Follow the interactive prompts to define your project. After this is finished:

- `cd` into your newly created project
- Create a Python virtual environment
- Activate the new virtual environment
- Install pip
- Use pip to install the packages listed in `requirements.txt`
- Build the html render of your book with `jupyterbook`

For Unix/MacOS:

```shell
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade pip
pip3 install -r requirements.txt
jupyter-book build <path_to_book>
```

For Windows:

```shell
py -m venv .venv
.venv\Scripts\activate
py -m pip install --upgrade pip
pip3 install -r requirements.txt
jupyter-book build <path_to_book>
```

Or, finally, by using the Python project tool `uv`:

```shell
uv venv
.venv/bin/activate
. .venv/bin/activate
uv pip install -r requirements.txt
jupyter-book build <path_to_book>
```

Create a Git repository for your Jupyter book and commit the changes.

```shell
git init --initial-branch=main
```

Before you push them, you should first configure the appropriate settings on either the GitHub or GitLab side.

### GitHub

Create a repository on GitHub and enable GitHub pages:

- go to Settings
- select the option 'Pages'
- Under 'Build and Deployment', select 'GitHub Actions' as the source for your pages

Now push your local changes to GitHub:

```shell
git remote add origin git@github.com/<username>/<project>
git add .
git commit -m "first commit"
git remote add origin git@github.com:<user>/<repository-name>.git
git push -u origin main
```

### GitLab

```shell
git remote add origin git@gitlab.tue.nl:rdi-lab/tests/my-test-book.git
```

## Contribute

If you want to contribute to this project, follow these steps:

```bash
# Clone the repository
git clone https://gitlab.tue.nl/rdi-lab/images/cookiecutter.git

# Navigate to the project directory
cd cookiecutter
```

Use VSCode with the devcontainer defined in this project to contribute. This way, you don't have to install any dependencies
locally.
