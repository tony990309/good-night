## Description

Get all users.

## Request

`GET /api/v1/users`

### Header

| Parameters       | Value              | Required | Description                |
| ---------------- | ------------------ | -------- | -------------------------- |
| **Content-Type** | `application/json` | `O`      | Request Body Content Type. |

## Response

| Parameters     | Value     | Description        |
| -------------- | --------- | ------------------ |
| **user_id**    | `Integer` | User ID            |
| **name**       | `String`  | User Name          |
| **created_at** | `Integer` | User Creation Time |

## Possible Errors

No specific errors for this endpoint.
