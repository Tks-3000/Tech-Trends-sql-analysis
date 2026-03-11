import pandas as pd
df = pd.read_csv("survey_results_public.csv")

df = df[['Country', 'YearsCode', 'LanguageHaveWorkedWith']]

df = df.dropna()

df['YearsCode'] = pd.to_numeric(df['YearsCode'], errors='coerce')

df = df[df['YearsCode'] < 50]

df = df.assign(Language=df['LanguageHaveWorkedWith'].str.split(';')).explode('Language')

df = df[['Country', 'YearsCode', 'Language']]

df.to_csv("cleaned_survey.csv", index=False)

print("Cleaning finished!")