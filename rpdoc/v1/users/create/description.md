## Description

Create a new user.

## Request

`POST /api/v1/users`

### Header

| Parameters       | Value              | Required | Description                |
| ---------------- | ------------------ | -------- | -------------------------- |
| **Content-Type** | `application/json` | `O`      | Request Body Content Type. |

### Body

| Parameters | Value    | Required? | Description |
| ---------- | -------- | --------- | ----------- |
| **name**   | `String` | `O`       | User Name   |

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
