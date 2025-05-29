# Backend Server

This is the backend server for the MERN stack application, built with Node.js, Express, and TypeScript.

## Prerequisites

- Node.js (v18 or higher)
- MongoDB (v6 or higher)
- npm or yarn

## Setup

1. Install dependencies:

   ```bash
   npm install
   ```

2. Create environment file:

   ```bash
   cp .env.example .env
   ```

   Then edit `.env` with your configuration.

3. Build the project:
   ```bash
   npm run build
   ```

## Development

1. Start development server:

   ```bash
   npm run dev
   ```

2. Run tests:

   ```bash
   npm test
   ```

3. Run linting:
   ```bash
   npm run lint
   ```

## Project Structure

```
backend/
├── src/              # Source files
│   ├── config/      # Configuration files
│   ├── controllers/ # Route controllers
│   ├── middleware/  # Custom middleware
│   ├── models/      # Database models
│   ├── routes/      # API routes
│   ├── services/    # Business logic
│   ├── types/       # TypeScript types
│   └── utils/       # Utility functions
├── dist/            # Compiled output
├── logs/            # Log files
└── docs/            # Documentation
```

## API Documentation

API documentation is available at `/api-docs` when running the server.

## Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm start` - Start production server
- `npm test` - Run tests
- `npm run lint` - Run linter
- `npm run format` - Format code with Prettier
