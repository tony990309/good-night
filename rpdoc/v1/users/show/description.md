## Description

Get a specific user by user ID.

## Request

`GET /api/v1/users/:user_id`

### Header

| Parameters       | Value              | Required | Description                |
| ---------------- | ------------------ | -------- | -------------------------- |
| **Content-Type** | `application/json` | `O`      | Request Body Content Type. |

### URL Parameters

| Parameters  | Value     | Required? | Description |
| ----------- | --------- | --------- | ----------- |
| **user_id** | `Integer` | `O`       | User ID     |

## Response

| Parameters     | Value     | Description        |
| -------------- | --------- | ------------------ |
| **user_id**    | `Integer` | User ID            |
| **name**       | `String`  | User Name          |
| **created_at** | `Integer` | User Creation Time |

## Possible Errors

| Error Code | Error Key       | Description       |
| ---------- | --------------- | ----------------- |
| 404_001    | user_not_found  | User not found    |
