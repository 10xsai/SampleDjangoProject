FROM python:3.6

COPY manage.py gunicorn-cfg.py requirements.txt ./
COPY core core
COPY app app

RUN pip install -r requirements.txt

RUN python manage.py makemigrations
RUN python manage.py migrate

EXPOSE 5005
CMD ["gunicorn", "--config", "gunicorn-cfg.py", "core.wsgi"]