## Description

Clock in (sleep or wake) for a user, and return all clock-in records for the user, ordered by created time.

## Request

`POST /api/v1/users/clock_in`

### Header

| Parameters       | Value              | Required | Description                |
| ---------------- | ------------------ | -------- | -------------------------- |
| **Content-Type** | `application/json` | `O`      | Request Body Content Type. |

### Body

| Parameters      | Value     | Required? | Description                        |
| --------------- | --------- | --------- | ---------------------------------- |
| **user_id**     | `Integer` | `O`       | User ID                            |
| **action_type** | `String`  | `O`       | Clock-in action: "sleep" or "wake" |

## Response

| Parameters        | Value     | Description            |
| ----------------- | --------- | ---------------------- |
| **clock_in_id**   | `Integer` | Clock-in ID            |
| **user_id**       | `Integer` | User ID                |
| **action_type**   | `String`  | Action type            |
| **created_at**    | `Integer` | Clock-in creation time |

## Possible Errors

| Error Code | Error Key                | Description                                    |
| ---------- | ------------------------ | ---------------------------------------------- |
| 400_000    | need_more_information    | Missing required parameters                    |
| 400_001    | invalid_clock_in_action  | Clock-in action_type only accept sleep or wake |
| 400_100    | user_is_sleeping         | User is sleeping (cannot sleep again)          |
| 400_101    | user_is_awake            | User is awake (cannot wake again)              |
| 404_001    | user_not_found           | User not found                                 |
