# Good Night - Sleep Tracking API

A simple sleep tracking RESTful API that allows users to record their sleep times, track friends' sleep patterns, and view sleep statistics.

## Features

- **User Management**: Create and search users
- **Sleep Recording**: Record sleep and wake up times
- **Social Features**: Follow friends and view their sleep records
- **Sleep Statistics**: View your own and friends' sleep duration statistics

## Technical Stack

- **Framework**: Ruby on Rails 8.0.2
- **Database**: PostgreSQL 17.5
- **Ruby Version**: 3.4.5
- **API**: RESTful API with JSON responses

## API Endpoints

### Postman Documentation

For detailed API documentation with examples, request/response formats, and interactive testing, please refer to our published Postman collection:

**[View Complete API Documentation](https://documenter.getpostman.com/view/23687423/2sB3BKFofD)**

### User Management
- `POST /api/v1/users` - Create a new user
- `GET /api/v1/users` - Get all users
- `GET /api/v1/users/:user_id` - Get specific user information
- `GET /api/v1/users/search?term=:name` - Search users

### Sleep Records
- `POST /api/v1/users/clock_in` - Record sleep/wake up time
- `GET /api/v1/sleep_durations` - Get sleep records

### Social Features
- `POST /api/v1/users/follow` - Follow a friend
- `POST /api/v1/users/unfollow` - Unfollow a friend
- `GET /api/v1/users/following` - Get following list
- `GET /api/v1/users/followers` - Get followers list

## Quick Start with Docker Compose

### Prerequisites

- Docker
- Docker Compose

### Setup Steps

1. **Clone the project**
   ```bash
   git clone <repository-url>
   cd good-night
   ```

2. **Build Docker image**
   ```bash
   docker build -t good-night-server:latest .
   ```

3. **Start services**
   ```bash
   docker-compose up -d
   ```

   This will start:
   - PostgreSQL database (default password: P@ssw0rd)
   - Rails API server (listening on port 80)

4. **Check service status**
   ```bash
   docker-compose ps
   ```

5. **View logs**
   ```bash
   docker-compose logs -f good_night_server
   ```

6. **Stop services**
   ```bash
   docker-compose down
   ```

### Environment Configuration

Environment variables are configured in the `backend.env` file:

```env
DB_HOST=postgres
DB_PORT=5432
DB_DATABASE=good_night_development
DB_USERNAME=postgres
DB_PASSWORD=P@ssw0rd
```

## Local Development

If you want to develop locally:

1. **Install dependencies**
   ```bash
   bundle install
   ```

2. **Setup database**
   ```bash
   rails db:setup
   ```

3. **Run tests**
   ```bash
   rspec
   ```

4. **Start server**
   ```bash
   rails server
   ```
