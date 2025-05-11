from freqtrade.strategy.interface import IStrategy
from pandas import DataFrame
from sklearn.ensemble import RandomForestClassifier
import numpy as np
import talib.abstract as ta

class MLStrategy(IStrategy):
    minimal_roi = {"0": 0.2}
    stoploss = -0.15
    timeframe = '5m'

    def populate_indicators(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe['rsi'] = ta.RSI(dataframe)
        dataframe['ema'] = ta.EMA(dataframe, timeperiod=20)
        dataframe['macd'] = ta.MACD(dataframe)[0]
        dataframe.dropna(inplace=True)
        return dataframe

    def populate_buy_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe.loc[
            (dataframe['rsi'] < 30) &
            (dataframe['close'] > dataframe['ema']),
            'buy'] = 1
        return dataframe

    def populate_sell_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe.loc[
            (dataframe['rsi'] > 70) |
            (dataframe['close'] < dataframe['ema']),
            'sell'] = 1
        return dataframe
