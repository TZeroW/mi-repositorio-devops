FROM python:3.9-slim 
# ^ 'slim' es más ligero, ideal para CI/CD
WORKDIR /app

# Copiamos desde la carpeta app del repo a la carpeta de trabajo en el contenedor
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .

EXPOSE 5000
CMD ["python", "app.py"]