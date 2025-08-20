## Description

Get the list of followers for the specified user.

## Request

`GET /api/v1/users/followers`

### Header

| Parameters       | Value              | Required | Description                |
| ---------------- | ------------------ | -------- | -------------------------- |
| **Content-Type** | `application/json` | `O`      | Request Body Content Type. |

### Query Parameters

| Parameters  | Value     | Required? | Description                    |
| ----------- | --------- | --------- | ------------------------------ |
| **user_id** | `Integer` | `O`       | User ID to get followers list  |

## Response

| Parameters     | Value     | Description        |
| -------------- | --------- | ------------------ |
| **user_id**    | `Integer` | User ID            |
| **name**       | `String`  | User Name          |
| **created_at** | `Integer` | User Creation Time |

## Possible Errors

| Error Code | Error Key      | Description    |
| ---------- | -------------- | -------------- |
| 404_001    | user_not_found | User not found |
