## Description

Follow another user.

## Request

`POST /api/v1/users/follow`

### Header

| Parameters       | Value              | Required | Description                |
| ---------------- | ------------------ | -------- | -------------------------- |
| **Content-Type** | `application/json` | `O`      | Request Body Content Type. |

### Body

| Parameters            | Value     | Required? | Description              |
| --------------------- | --------- | --------- | ------------------------ |
| **user_id**           | `Integer` | `O`       | Current user ID          |
| **following_user_id** | `Integer` | `O`       | Target user ID to follow |

## Response

| Parameters | Value    | Description |
| ---------- | -------- | ----------- |
| **status** | `String` | "ok"        |

## Possible Errors

| Error Code | Error Key                | Description                 |
| ---------- | ------------------------ | --------------------------- |
| 400_000    | need_more_information    | Missing required parameters |
| 400_200    | invalid_following_target | Invalid following target    |
| 404_001    | user_not_found           | User not found              |
