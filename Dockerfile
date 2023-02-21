FROM python:3.10

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--port", "8080", "--host", "0.0.0.0"]