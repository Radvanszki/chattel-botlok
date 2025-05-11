from freqtrade.strategy.interface import IStrategy
import pandas as pd
import pandas_ta as ta

class MLStrategy(IStrategy):
    timeframe = '5m'
    minimal_roi = {"0": 0.2}
    stoploss = -0.15
    trailing_stop = False

    def populate_indicators(self, dataframe: pd.DataFrame, metadata: dict) -> pd.DataFrame:
        dataframe['rsi'] = ta.rsi(dataframe['close'], length=14)
        return dataframe

    def populate_buy_trend(self, dataframe: pd.DataFrame, metadata: dict) -> pd.DataFrame:
        dataframe.loc[
            (dataframe['rsi'] < 30),
            'buy'] = 1
        return dataframe

    def populate_sell_trend(self, dataframe: pd.DataFrame, metadata: dict) -> pd.DataFrame:
        dataframe.loc[
            (dataframe['rsi'] > 70),
            'sell'] = 1
        return dataframe
