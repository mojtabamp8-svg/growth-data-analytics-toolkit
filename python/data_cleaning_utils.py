import pandas as pd

def clean_amount_column(df, col):
    df[col] = df[col].astype(str).str.replace(",", "").astype(float)
    return df

def remove_outliers(df, col, z=3):
    return df[(df[col] - df[col].mean()).abs() <= z * df[col].std()]
