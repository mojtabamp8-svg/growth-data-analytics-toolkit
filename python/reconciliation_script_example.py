import pandas as pd

def reconcile(bank_df, internal_df, key="transaction_id"):
    merged = bank_df.merge(internal_df, on=key, how="outer", indicator=True)
    mismatches = merged[merged["_merge"] != "both"]
    return mismatches

# Example usage:
# mismatches = reconcile(bank_data, internal_data)
