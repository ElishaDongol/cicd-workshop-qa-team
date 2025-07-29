#!/bin/bash
cd frontend
npm install
npm run build
aws s3 sync build/ s3://S3_BUCKET_NAME --delete
aws cloudfront create-invalidation --distribution-id
echo "Frontend deployed successfully to S3 and CloudFront invalidation triggered."