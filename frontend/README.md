# Frontend Application

This is the frontend application for the MERN stack, built with React, TypeScript, and Vite.

## Prerequisites

- Node.js (v18 or higher)
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
frontend/
├── src/              # Source files
│   ├── assets/      # Static assets
│   ├── components/  # React components
│   ├── hooks/       # Custom hooks
│   ├── layouts/     # Layout components
│   ├── pages/       # Page components
│   ├── services/    # API services
│   ├── store/       # State management
│   ├── styles/      # Global styles
│   ├── types/       # TypeScript types
│   └── utils/       # Utility functions
├── public/          # Public assets
└── dist/           # Build output
```

## Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm test` - Run tests
- `npm run lint` - Run linter
- `npm run format` - Format code with Prettier

## Features

- ⚡️ Vite for fast development and building
- 🔥 React 18 with TypeScript
- 📦 Modern ES6+ features
- 🎨 CSS Modules and SCSS support
- 📱 Responsive design
- 🔒 Authentication ready
- 🌐 API integration ready
- 📝 ESLint and Prettier configured
- 🧪 Testing setup with Vitest
