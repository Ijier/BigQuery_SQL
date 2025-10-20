# 💬 User Sentiment Analysis (Gemini + BigQuery SQL)

This folder showcases a **data analysis portfolio pipeline** for user reviews, implemented using Google BigQuery and the Gemini generative AI model.

The process involves leveraging BigQuery ML to perform **sentiment analysis on the provided input data**, followed by robust data cleaning and standardization using advanced SQL. The resulting refined data is used to power the live Looker Studio dashboard demo.

***

## 🛠️ Technology Stack & Files

| Component | Role |
| :--- | :--- |
| **Google BigQuery** | Data warehouse and SQL execution environment. |
| **Gemini / BigQuery ML** | Large Language Model (LLM) integration for sentiment analysis and keyword extraction. |
| **Looker Studio** | Visualization of the analyzed results (Live Demo). |

### 📁 Files in this Directory

| File Name | Description |
| :--- | :--- |
| **`INPUT/customer_review.csv`** | **The original raw data file containing the `review_text` used for sentiment analysis.** This file represents the source data loaded into BigQuery for processing. |
| **`sentiment_analysis_and_data_cleaning_view.sql`** | The core SQL file. It creates a logical view (`cleaned\_data\_view`) by integrating Gemini's output and performing necessary data cleaning and joins for visualization. **This SQL operates on a table containing data derived from the `review_text` column.** |
| **`OUPTUT/looker_studio.url`** | A direct link to the live demo dashboard. |

***

## ⚙️ SQL Processing Highlights

The `sentiment_analysis_and_data_cleaning_view.sql` file demonstrates advanced BigQuery SQL techniques, focusing on the following:

### 1. Integration of Generative AI (Gemini) Results
The query performs an **INNER JOIN** on two separate AI-analyzed result tables (`p1` for sentiment, `p2` for keywords) using the `customer_id` and `location_id` keys. This effectively integrates the sentiment score and extracted keywords for comprehensive reporting. **The sentiment analysis itself is based on the `review_text` column from the input data.**

### 2. Data Cleansing and Standardization (Regex & String Functions)
The SQL includes robust data preprocessing essential for reliable analytics:

* **Sentiment Label Standardization**: Uses `TRIM(REPLACE(REPLACE(LOWER(...), '.', ''), ' ', ''))` to remove leading/trailing spaces, punctuation, and converts the labels to **lowercase**. This ensures clean, consistent sentiment categories from the LLM's output.
* **Source Name Normalization**: **Nested `REGEXP_REPLACE` functions** are used to consolidate variations in social media source names (e.g., `Google Reviews`, `YELP`, `SocialMedia1`) into standardized labels like `Google`, `Yelp`, and `Social Media`.

***

## 📊 Live Demo

The **Looker Studio dashboard**, powered by the view generated from this SQL, is available for demonstration:

[➡️ Access the Live Sentiment Analysis Dashboard]
(Please insert your Looker Studio URL here)