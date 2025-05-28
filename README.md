# MERN Stack Monorepo ESLint + Prettier + Husky Setup

## Project Structure

```
mern-template/
├── backend/           # TypeScript Node.js
├── frontend/          # React TypeScript
├── .husky/
│   ├── pre-commit
│   ├── commit-msg
│   └── pre-push
├── package.json       # Root coordination
└── README.md
```

## 1. Installation Commands

```bash
# Root dependencies
npm install

# Backend dependencies
cd backend && npm install && cd ..

# Frontend dependencies
cd frontend && npm install && cd ..

# Initialize husky (if not already done)
npx husky install
```

## or run setup-script.sh

```bash
# Make it executable:
chmod +x setup-script.sh

# Run it:
./setup-script.sh
```

## 2. Development Workflow

```bash
# Start both frontend and backend
npm run dev

# Lint everything
npm run lint

# Fix all linting issues
npm run lint:fix

# Format all code
npm run format

# Type check everything
npm run type-check

# Run all tests
npm run test

# Build for production
npm run build
```

## 3. Example Backend Structure

```
backend/
├── src/
│   ├── index.ts
│   ├── routes/
│   │   └── api.ts
│   ├── models/
│   │   └── User.ts
│   ├── middleware/
│   │   └── auth.ts
│   └── types/
│       └── index.ts
├── dist/
├── eslint.config.js
├── tsconfig.json
└── package.json
```

## 4. Example Frontend Structure

```
frontend/
├── src/
│   ├── App.tsx
│   ├── main.tsx
│   ├── components/
│   │   └── Header.tsx
│   ├── pages/
│   │   └── Home.tsx
│   ├── hooks/
│   │   └── useApi.ts
│   └── types/
│       └── index.ts
├── public/
├── dist/
├── eslint.config.js
├── tsconfig.json
├── vite.config.ts
└── package.json
```

## 5. Git Workflow

When you commit, this happens automatically:

1. **Pre-commit**: Type checking + lint-staged (lint & format changed files)
2. **Commit-msg**: Validates commit message format
3. **Pre-push**: Runs tests + builds both frontend and backend

### Example Valid Commits:

- `feat(backend): add user authentication API`
- `fix(frontend): resolve login form validation`
- `docs: update API documentation`
- `chore: update dependencies`

This setup ensures consistent code quality across your entire MERN stack with proper TypeScript support, React-specific linting, and coordinated build processes!
