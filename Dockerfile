# Alap Docker image
FROM python:3.9-slim

# Szükséges csomagok telepítése
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    curl \
    gcc \
    g++ \
    make \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Pip frissítése és TA-Lib Python csomag telepítése
RUN pip install --upgrade pip
RUN pip install --no-cache-dir numpy
RUN pip install --no-cache-dir TA-Lib==0.6.3

# Munkakönyvtár beállítása
WORKDIR /app

# requirements.txt bemásolása és függőségek telepítése
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Projekt fájlok bemásolása
COPY . .

# Alkalmazás futtatása
CMD ["python", "main.py"]
