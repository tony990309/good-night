## Description

Search users by name (case-insensitive).

## Request

`GET /api/v1/users/search`

### Header

| Parameters       | Value              | Required | Description                |
| ---------------- | ------------------ | -------- | -------------------------- |
| **Content-Type** | `application/json` | `O`      | Request Body Content Type. |

### Query Parameters

| Parameters | Value    | Required? | Description          |
| ---------- | -------- | --------- | -------------------- |
| **term**   | `String` | `O`       | Search term for name |

### Body

No request body required.

## Response

| Parameters     | Value     | Description        |
| -------------- | --------- | ------------------ |
| **user_id**    | `Integer` | User ID            |
| **name**       | `String`  | User Name          |
| **created_at** | `Integer` | User Creation Time |

## Possible Errors

| Error Code | Error Key             | Description                 |
| ---------- | --------------------- | --------------------------- |
| 400_000    | need_more_information | Missing required parameters |
