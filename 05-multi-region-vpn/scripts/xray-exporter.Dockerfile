FROM python:3.11-alpine
WORKDIR /app
COPY exporter.py .
CMD ["python3", "exporter.py"]
