## Description

Get sleep durations with filtering options. By default, returns following users' records for one week, ranked by duration.

## Request

`GET /api/v1/sleep_durations`

### Header

| Parameters       | Value              | Required | Description                |
| ---------------- | ------------------ | -------- | -------------------------- |
| **Content-Type** | `application/json` | `O`      | Request Body Content Type. |

### Query Parameters

| Parameters     | Value     | Required? | Description                                                |
| -------------- | --------- | --------- | ---------------------------------------------------------- |
| **user_id**    | `Integer` | `O`       | User ID                                                    |
| **target**     | `String`  | `X`       | Whose records you want to search<br/>`self` for own<br/>`following` for following users<br/>Default is `following` |
| **start_time** | `String`  | `X`       | Start datetime (ISO 8601 format)<br/>Default is 1 week ago |
| **end_time**   | `String`  | `X`       | End datetime (ISO 8601 format)<br/>Default is now          |
| **page**       | `Integer` | `X`       | Page number for pagination<br/>Default is 1                |
| **per_page**   | `Integer` | `X`       | Number of items per page<br/>Default is 20                 |

## Response

| Parameters              | Value     | Description                       |
| ----------------------- | --------- | --------------------------------- |
| **sleep_durations**     | `Array`   | Array of [SleepDurationObject](#sleepdurationobject) |
| **current_page**        | `Integer` | Current page number               |
| **total_pages**         | `Integer` | Total number of pages             |
| **total_count**         | `Integer` | Total number of items             |

### SleepDurationObject

| Parameters              | Value     | Description                       |
| ----------------------- | --------- | --------------------------------- |
| **sleep_duration_id**   | `Integer` | Sleep duration ID                 |
| **user_id**             | `Integer` | User ID                           |
| **user_name**           | `String`  | User name                         |
| **duration**            | `Integer` | Sleep duration in seconds         |
| **start_time**          | `Integer` | Sleep start time (Unix timestamp) |
| **end_time**            | `Integer` | Sleep end time (Unix timestamp)   |
| **created_at**          | `Integer` | Record creation time              |

## Possible Errors

| Error Code | Error Key             | Description                 |
| ---------- | --------------------- | --------------------------- |
| 400_000    | need_more_information | Missing required parameters |
| 404_001    | user_not_found        | User not found              |
