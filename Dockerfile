FROM python:3.7-slim-buster as base

# Setup env
ENV PIPENV_VENV_IN_PROJECT 1
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

FROM base AS python-deps

RUN pip install pipenv

# Install python dependencies in /.venv
COPY Pipfile .
COPY Pipfile.lock .
RUN pipenv install --deploy

FROM base AS runtime

COPY --from=python-deps /.venv /.venv
ENV PATH="/.venv/bin:$PATH"

# RUN useradd --create-home app
WORKDIR /home/app
# USER app

COPY . .
# Set the entrypoint 
EXPOSE 5000
ENTRYPOINT [ "python", "app.py" ]
