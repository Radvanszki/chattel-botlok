# Alap Docker image
FROM python:3.9-slim

# Szükséges eszközök és csomagok telepítése
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

# TA-Lib natív könyvtár telepítése forrásból
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    tar -xvzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd .. && rm -rf ta-lib ta-lib-0.4.0-src.tar.gz

# Pip frissítése és TA-Lib Python csomag telepítése
RUN pip install --upgrade pip
RUN pip install --no-cache-dir numpy
RUN pip install --no-cache-dir TA-Lib

# Munkakönyvtár beállítása
WORKDIR /app

# requirements.txt bemásolása és függőségek telepítése
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Projekt fájlok bemásolása
COPY . .

# Alkalmazás futtatása
CMD ["python", "main.py"]
