FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libpq-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
