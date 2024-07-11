

# pass-batch

This is the batch repository for the PT Subscription Management Service. It provides the following functionalities: subscription expiry, bulk subscription grant, pre-class notification, and post-class subscription deduction.

## Environments
* OpenJDK 18.0.1
* Spring Boot 2.7.3
* Gradle
* MySQL (Docker)
* JPA
* lombok
* ModelMapper

## Process
### Subscription Expiry
### JOB1. 이용권 만료
* `chunk step`
* Read the targets for subscription expiry (ExpirePassesReader) and update their status to expired (ExpirePassesWriter)
```mermaid
sequenceDiagram
    participant Batch
    participant DB
    Batch->>DB: Query subscription for each user
    activate DB
    DB->>Batch: Response with subscription for each user
    deactivate DB
    Batch->>DB: Update subscription status to expired

```

### Bulk Subscription Grant
* `tasklet step`
* When registered by the admin, the subscriptions are granted to users at a specified time (AddPassesTasklet)
```mermaid
sequenceDiagram
    actor User
    participant DB
    participant Batch
    User->>DB: Request to register bulk subscription

    Batch->>DB: Query bulk subscription
    activate DB
    DB->>Batch: Response with bulk subscription
    deactivate DB
    Batch->>DB: Add subscription to respective users

```

### Pre-class Notification
* `multiple thread chunk step`
* -> Parallel processing provided by Spring Batch
1. Step1: Retrieve the targets for notification
2. Step2: Send the notifications
```mermaid
sequenceDiagram
    participant Batch
    participant DB
    participant Messenger
    Batch->>DB: Query scheduled classes and users
    activate DB
    DB->>Batch: Response with scheduled classes and users
    deactivate DB
    Batch->>DB: Add notification targets
    
    Batch->>DB: Query notification targets
    activate DB
    DB->>Batch: Response with notification targets
    deactivate DB
    Batch->>Messenger: Request to send notification
    activate Messenger
    Messenger->>Batch: Notification response
    deactivate Messenger

```

### Post-class Subscription Deduction
* `chunk step`
* UserPassesReader -> AsyncItemProcessor -> AsyncItemWriter
```mermaid
sequenceDiagram
    participant Batch
    participant DB
    Batch->>DB: Query scheduled classes and users
    activate DB
    DB->>Batch: Response with scheduled classes and users
    deactivate DB
    Batch->>DB: Deduct subscription for each user

```
# Job Scheduling
## AddPassesJob 
### Description
![](Images/addPassesJob/register_pass.png)
![](Images/addPassesJob/confirm_adding_pass.png)
![](Images/addPassesJob/issue_pass.png)
![](Images/addPassesJob/run_job.png)
![](Images/addPassesJob/user_page.png)

## makeStatisticsJob 
### Description
![](Images/makeStatisticsJob/stat_page.png)
![](Images/makeStatisticsJob/run.png)
![](Images/makeStatisticsJob/after_job_work.png)