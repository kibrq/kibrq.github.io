# Base image: Ruby with necessary dependencies for Jekyll
FROM ruby:3.2

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*


# Create a non-root user with UID 1000
RUN groupadd -g 1000 vscode && \
    useradd -m -u 1000 -g vscode vscode

# Set the working directory
WORKDIR /usr/src/app

# Keep container gems outside the source mount and ignore host Bundler settings.
ENV BUNDLE_IGNORE_CONFIG=true \
    BUNDLE_PATH=/usr/local/bundle

# Install the exact dependencies recorded in the repository lockfile.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v 2.5.22 --no-document && \
    bundle install && \
    bundle exec jekyll --version

# Set permissions for the working directory
RUN chown -R vscode:vscode /usr/src/app

# Switch to the non-root user
USER vscode

# Command to serve the Jekyll site
CMD ["bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0", "-w", "--config", "_config.yml,_config_docker.yml"]
