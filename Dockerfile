FROM python:3.9-slim

# Frissítsük a rendszer csomagkezelőt, majd telepítsük a build-eszközöket
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libffi-dev \
    libssl-dev \
    libta-lib0 \
    libta-lib0-dev \
    wget \
    unzip \
    && pip install --upgrade pip

# Dolgozási könyvtár beállítása
WORKDIR /app

# Csomagok bemásolása
COPY requirements.txt .
RUN pip install -r requirements.txt

# Projekt fájlok bemásolása
COPY . .

CMD ["python", "main.py"]
