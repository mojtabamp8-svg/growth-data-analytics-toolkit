import pandas as pd

def add_recency(df, date_col):
    df["recency_days"] = (pd.Timestamp.now() - df[date_col]).dt.days
    return df

def add_frequency(df, user_col):
    freq = df.groupby(user_col).size().reset_index(name="frequency")
    return df.merge(freq, on=user_col)
