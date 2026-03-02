FROM python:3.11-slim

# Install PostgreSQL client libraries required for psycopg2
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY frame_v2/app.py ./frame_v2/
COPY frame_v2/templates/ ./frame_v2/templates/
COPY frame_v2/static/ ./frame_v2/static/

EXPOSE 5000
CMD ["python", "app.py"]
