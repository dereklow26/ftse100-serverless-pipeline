# Serverless Data Pipeline for FTSE-100
*This project is mostly for myself. In an attempt to understand more about how stocks work, as well as enhance my ability in building applications in AWS, I decided to utilise my holiday time to build a larger project. 

The goal is to be able to automate CSV file uploads daily from Yahoo Finance, validate it to queryable results, build logs and metrics for observability, construct a Dead Letter Queue for error handling. 

I also plan to upload this to Github as a Portfolio object, including architectural diagrams, README, sample data, saved queries and screenshots. 

I hope this project will lead to even larger projects in the future, and give confidence in taking the AWS Solutions Architect Associate exam in the future. Ultimately, I hope this is a stepping stone to my goal of being a Cloud Engineer/Solutions Architect. 

## Technologies
AWS Lambda
Amazon S3 (Raw + Clean Zones)
AWS Glue Catalog
Amazon Athena
Amazon QuickSight
Terraform (IaC)
Python (yfinance, pandas)

## Architectural Diagram

Split into 5 sections: Ingestion, Raw, Processing, Analytics and Monitoring.

Ingestion: 
Raw:
Processing:
Analytics:
Monitoring: 
