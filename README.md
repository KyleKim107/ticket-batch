

# pass-batch

PT 이용권 관리 서비스 내 배치 repository 입니다.
이용권 만료, 일괄 지급, 수업 전 알림, 수업 후 이용권 차감 기능을 제공합니다.

## Environments
* OpenJDK 18.0.1
* Spring Boot 2.7.3
* Gradle
* MySQL (Docker)
* JPA
* lombok
* ModelMapper

## Process
### 이용권 만료
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

### 이용권 일괄 지급
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

### 수업 전 알림
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

### 수업 후 이용권 차감
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
