# Freqtrade ML Bot (Telegram + Railway verzió)

## Telepítés Railway-re

1. Töltsd fel ezt a projektet egy GitHub repo-ba
2. Railway-en:
   - New Project → Deploy from GitHub
   - A Dockerfile automatikusan felismerésre kerül
3. Állítsd be a környezeti változókat:
   - BINANCE_API_KEY
   - BINANCE_API_SECRET
   - TELEGRAM_TOKEN
   - TELEGRAM_CHAT_ID
4. Deploy után a bot automatikusan elindul (dry-run módban)

Ez a verzió Telegram értesítést is küld!
