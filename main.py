from freqtrade import FreqtradeBot
from freqtrade.strategy import IStrategy

class MyStrategy(IStrategy):
    # Strategy settings and methods

if __name__ == "__main__":
    bot = FreqtradeBot(strategy=MyStrategy)
    bot.start(
