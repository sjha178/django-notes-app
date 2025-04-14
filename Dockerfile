FROM python:3.9

WORKDIR /app/backend

COPY requirements.txt /app/backend
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*


# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt


COPY . /app/backend
CMD ["tail", "-f","/dev/null"]
EXPOSE 8000
#RUN this   python    manage.py migrate
#RUNj cspython   ,nage.py m akemigrations
