# AWS CloudFront

**CloudFront Overview**

- Under networking
- Content delivery network (CDN)
- Delivers webpages and other web content to a user based on the geographic location
- Edge location - where content will be cached (separate to a region or AZ)
- Distribution - collection of edge locations
- Edge location downloads from origin and caches, with TTL
- Web distribution - for websites
- RTMP - used for media streaming

**CloudFront Distribution Lab**

- CloudFront is a global service
- Restrict bucket access - cloudfront urls vs s3 urls
- Can use the CloudFront distribution url to view the files e.g. image files
- Invalidations can be created
    - Can invalidate individual objects, or directories (using wildcards etc.)
    - Removes them from the CloudFront edge caches
    - Will be charged for this
- Origin can be S3, EC2, ELB, Route53 etc.
- Edge locations can be read from and also written to

**CloudFront and S3 Signed URLs and Cookies**

- CloudFront Signed URL
    - If Origin is EC2
    - A signed URL is for individual files. 1 file = 1 URL
    - A signed cookie is for multiple files. 1 cookie = multiple files
    - When we create signed URLs or cookies, we attach a policy e.g. with URL expiration, IP ranges, Trusted signers (which AWS accounts can create signed urls)
    - After signing into aplpication, the app uses SDK to generate a signed url, and then the app returns the signed url.
- S3 Signed URL
    - IF origin is S3
    - Issues a request as the IAM user who creates the signed URL
