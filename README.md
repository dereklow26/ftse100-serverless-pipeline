# Serverless Data Pipeline for FTSE-100
*This project is mostly for myself. In an attempt to understand more about how stocks work, as well as enhance my ability in building applications in AWS, I decided to utilise my holiday time to build a larger project. 

The goal is to be able to automate CSV file uploads daily from Yahoo Finance, validate it to queryable results, build logs and metrics for observability, construct a Dead Letter Queue for error handling. 

I also plan to upload this to Github as a Portfolio object, including architectural diagrams, README, sample data, saved queries and screenshots. 

I hope this project will lead to even larger projects in the future, and give confidence in taking the AWS Solutions Architect Associate exam in the future. Ultimately, I hope this is a stepping stone to my goal of being a Cloud Engineer/Solutions Architect. 

## Technologies
AWS Lambda (Runs code in response to events without managing infrastructure)
Amazon S3 (Stores raw and clean data)
AWS Glue Catalog (Keep track of data schemas for data in S3)
Amazon Athena (Run queries directly on S3 data)
Amazon QuickSight (Builds interactive dashboards and visualization from Athena queries)
Terraform (IaC tool that manages resources)
Python (yfinance to fetch stock market data and pandas to clean datasets) 

## Functional Goals
1. Automate ingestion of FTSE-100 stock price data daily
2. Store raw data in S3 with partitioned folders
3. Provide SQL-based analytics via Athena and visual dashboards via QuickSight
4. Ensure reliability through idempotency, retries and principle of least priviledge
5. Keep the solution secure (IAM Least Priviledge) and cost-effective (<$10/month)

## Non-functional goals 
Defines the consistency, standard, security expectation, and targets of this project

### Idempotency
- Ensure reprocessing data from the same date do not create duplicate data
- Use dt='YYYY-MM-DD' as unique identifiers for each folder
- Store processed markers in S3

### Retries
- Lambda retries with exponential backoff for a maximum of 3 attempts
- Data that cannot be fully processed is sent to SQS DLQ for inspection

### IAM Least Priviledge
- Each Lambda has its own IAM role
- Permissions set to only required actions:
-   Fetch Lambda: s3:PutObject in raw zone
-   Transform Lambda: s3:GetObject (raw), s3:PutObject (clean), sqs:SendMessage (DLQ)
- No AdministratorAccess or broad permissions is given
- Enforced using Terraform IAM role definitions

### Cost Targets
- Total cost: <$10/month
- Raw Data: Removed after 30 days
- Clean Data: Move to Glacier after 90 days, removed after 6 months
- Athena: Partitioned queries by date to minimize scanned data

## Data Flow (Architectural Diagram)

Architectural diagram can be found in docs folder.

Split into 5 sections: Ingestion, Raw, Processing, Analytics and Monitoring.

Ingestion: Collects raw data
Raw: Stores raw data
Processing: Clean and shape data
Analytics: Visualise and query clean data
Monitoring: Keep track of alerts, logs and metrics

