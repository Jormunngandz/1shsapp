FROM python:3.11
WORKDIR /app
ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip "poetry==1.5.1"
RUN poetry config virtualenvs.create false --local
COPY poetry.lock pyproject.toml ./
COPY mysite .
RUN poetry install --no-root



CMD ["gunicorn", "mysite.wsgi:applicatoon", "--bind", "0.0.0.0:8080"]