class singleVar:
    def __init__(self, col, p, ks_stat):
        self.col = col
        self.p = p
        self.ks_stat = ks_stat

class KSFrame:
    def __init__(self, df1, df2):
        self.df1 = df1
        self.df2 = df2
        self.vars = []
    def add_stat(self, col, p, ks_stat):
        var = singleVar(col, p, ks_stat)
        self.vars.append(var)