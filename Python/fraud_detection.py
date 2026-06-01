import pandas  as pd 
import numpy as np
import matplotlib.pyplot as plt

# Data cleaning 

dframe  = pd.read_csv('payment_fraud.csv')

print(dframe.isnull().sum())

dframe.drop_duplicates(inplace=True)

dframe.fillna(0 , inplace=True)

# fraud detection 

fraud_count = dframe['label'].value_counts()

fraud_per = dframe['label'].value_counts(normalize=True) * 100

fraudby_country = (
    dframe.groupby('Country')['label']
    .mean()
    .mul(100)
    .sort_values(ascending=False)
)

fraudby_paymentmethod =( dframe.groupby('paymentMethod')['label'].mean().round(4).sort_values(ascending=False) * 100)

fraudby_category = (dframe.groupby('Category')['label'].mean().round(4).sort_values(ascending=False) * 100)

fraudby_weekend = (dframe.groupby('isWeekend')['label'].mean().round(4).sort_values(ascending=False) * 100)

fraudby_Device = (dframe.groupby('DeviceType')['label'].mean().round(4) * 100)

correlation = (dframe.corr(numeric_only=True).round(3))

top_fraud_combination = (dframe.groupby(['paymentMethod', 'DeviceType', 'Category'])['label'].mean().round(4).sort_values(ascending=False).head(10) * 100)

fraud_hostpot_analysis =(dframe.groupby(['Region', 'Country'])['label'].mean().round(4).sort_values(ascending=False).head(10) * 100)

# numpy 

amounts = dframe['TransactionAmount'].to_numpy()
account_age = dframe['accountAgeDays'].to_numpy()
payment_age = dframe['paymentMethodAgeDays'].to_numpy()
fraud_labels = dframe['label'].to_numpy()
 

# Transaction statistics :

print("Average Transaction:", np.mean(amounts))
print("Median Transaction:", np.median(amounts))
print("Maximum Transaction:", np.max(amounts))
print("Minimum Transaction:", np.min(amounts))
print("Standard Deviation:", np.std(amounts))

# timebased fraud numpy :

dframe['Hour'] = pd.to_datetime(dframe['localTime']).dt.hour
hourly_fraud = dframe.groupby('Hour')['label'].mean() * 100
print(hourly_fraud.round(2))

# charts


paymentmethod_chart = dframe.groupby('paymentMethod')['label'].mean() * 100
paymentmethod_chart.plot(kind='bar')
plt.title("Fraud by Payment Method")
plt.show()

category_chart = dframe.groupby('Category')['label'].mean() * 100
category_chart.plot(kind='bar')
plt.title("Fraud Rate by Category")
plt.show()

hourly_fraud.plot(kind='line')
plt.title('Fraud Rate by Hour')
plt.xlabel('Hour')
plt.ylabel('Fraud Rate (%)')
plt.show()

# Exporting file
  
dframe.to_csv("cleaned_fraud_data.csv" , index=False)



# Final buisseness insights : 
print("\nBUSINESS INSIGHTS")

print(
    f"Overall Fraud Rate: {fraud_per[1]:.2f}%"
)

print(
    f"Highest Risk Payment Method: {fraudby_paymentmethod.idxmax()}"
)

print(
    f"Highest Risk Category: {fraudby_category.idxmax()}"
)

print(
    f"Highest Risk Region: {fraud_hostpot_analysis.idxmax()}"
)

# Fraud is higher in certain payment methods
# New accounts are more risky
# Certain regions show higher fraud probability
# High transaction amounts are linked with fraud
# Mobile devices may have higher fraud risk
