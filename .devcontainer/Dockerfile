FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Install additional packages needed for development
RUN apt-get update && apt-get install -y --no-install-recommends \
    git=1:2.34.1-1ubuntu1.12 \
    bash-completion=1:2.11-5ubuntu1 \
    curl=7.81.0-1ubuntu1.20 \
    gnupg=2.2.27-3ubuntu2.1 \
    lsb-release=11.1.0ubuntu4 \
    vim=2:8.2.3995-1ubuntu2.23 \
    jq=1.6-2.1ubuntu3 \
    unzip=6.0-26ubuntu3.2 \
    make=4.3-4.1build1 \
    nodejs=12.22.9~dfsg-1ubuntu3.6 \
    npm=8.5.1~ds-1 \
    python3-pip=22.0.2+dfsg-1ubuntu0.5 \
    wget \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install development tools
RUN pip3 install --no-cache-dir pre-commit==4.1.0 detect-secrets==1.5.0 yamllint==1.36.0 shellcheck-py==0.10.0.1 gitlint==0.19.1 \
    && npm install -g markdownlint-cli \
    && wget -qO /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v2.12.0/hadolint-Linux-x86_64 \
    && chmod +x /usr/local/bin/hadolint

# Install Docker CLI
RUN wget -qO - https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends docker-ce-cli=5:28.0.1-1~ubuntu.22.04~jammy \
    && rm -rf /var/lib/apt/lists/*

# Install GitHub CLI (optional but useful for GitHub projects)
RUN mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& apt-get update \
	&& apt-get install --no-install-recommends gh -y

# # Set up a non-root user for better security
ARG USERNAME=vscode

# # Create Docker config directory for the user
RUN mkdir -p /home/$USERNAME/.docker \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/.docker

USER $USERNAME
