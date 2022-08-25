FROM python:latest

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
	&& rm -rf /var/lib/apt/lists/*
COPY requirement.txt ./	
RUN pip install -r requirement.txt

RUN git clone https://github.com/tanrax/flask-contacts
WORKDIR /flask-contacts
RUN python3 migrations.py

EXPOSE 5000
CMD ["python3", "app.py"]