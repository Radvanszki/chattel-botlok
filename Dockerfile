FROM python:3.9-slim

# Alapvető függőségek és build eszközök telepítése
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    curl \
    gcc \
    g++ \
    make \
    libffi-dev \
    libssl-dev \
    libta-lib0-dev \
    ta-lib \
    && rm -rf /var/lib/apt/lists/*

# Pip frissítése
RUN pip install --upgrade pip

# Railway specifikus környezeti változók (ha szükséges)
ENV RAILWAY_STATIC_URL=/static

# Munkakönyvtár beállítása
WORKDIR /app

# requirements.txt bemásolása és függőségek telepítése
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Projekt fájlok bemásolása
COPY . .

# Alkalmazás futtatása
CMD ["python", "main.py"]
