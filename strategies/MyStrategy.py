from freqtrade.strategy import IStrategy

class MyStrategy(IStrategy):
    minimal_roi = {"0": 0.05}
    stoploss = -0.1
    timeframe = '5m'

    def populate_indicators(self, dataframe, metadata):
        return dataframe

    def populate_buy_trend(self, dataframe, metadata):
        dataframe.loc[:, 'buy'] = 0
        dataframe.loc[dataframe['close'] > dataframe['open'], 'buy'] = 1
        return dataframe

    def populate_sell_trend(self, dataframe, metadata):
        dataframe.loc[:, 'sell'] = 0
        dataframe.loc[dataframe['close'] < dataframe['open'], 'sell'] = 1
        return dataframe