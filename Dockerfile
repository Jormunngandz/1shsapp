FROM python:3.11

ENV PYTHONUNBUFFERED=1

WORKDIR /app




RUN pip install --upgrade pip "poetry==1.5.1"
RUN poetry config virtualenvs.create false --local
COPY poetry.lock pyproject.toml ./
RUN poetry install --no-root

COPY mysite .

CMD ["gunicorn", "mysite.wsgi:applicatoon", "--bind", "0.0.0.0:8080"]