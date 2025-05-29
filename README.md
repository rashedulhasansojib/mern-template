# MERN Stack Monorepo Template

A modern, beginner-friendly MERN (MongoDB, Express.js, React, Node.js) stack template with a monorepo structure. This template includes ESLint, Prettier, and Husky for code quality, along with a simple CI/CD pipeline.

## 🚀 Quick Start

### Prerequisites

- Node.js (v22 or higher)
- npm (comes with Node.js)
- Git
- MongoDB (local or Atlas)

### Initial Setup

1. **Clone the template**

   ```bash
   git clone <your-repo-url>
   cd mern-template
   ```

2. **Run the setup script**

   ```bash
   # Make the script executable
   chmod +x setup.sh

   # Run the setup script
   ./setup.sh
   ```

   The script will:

   - Check for Node.js and npm
   - Ask for your project name
   - Set up MongoDB connection
   - Create environment files
   - Install dependencies
   - Initialize Git repository

3. **Start development servers**

   ```bash
   # Start both frontend and backend in development mode
   npm run dev

   # Or start them separately:
   npm run dev:frontend  # Frontend on http://localhost:5173
   npm run dev:backend   # Backend on http://localhost:5000
   ```

## 🔄 CI/CD Pipeline

This project includes a CI/CD pipeline that runs on GitHub Actions. The pipeline is configured to ensure code quality and prepare for deployment.

### Pipeline Triggers

The pipeline runs on:

- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches

### Pipeline Steps

1. **Setup**:

   - Checks out code
   - Sets up Node.js v22
   - Configures npm caching for faster builds

2. **Dependency Installation**:

   - Installs root dependencies
   - Installs backend dependencies
   - Installs frontend dependencies

3. **Code Quality Checks**:

   - Code formatting (Prettier)
   - Linting (ESLint)
   - Type checking (TypeScript)
   - Build verification

4. **Deployment** (Ready to be configured):
   - Staging deployment (on push to `develop`)
   - Production deployment (on push to `main`)

### Setting Up CI/CD

1. **Enable GitHub Actions**:

   - Go to your repository on GitHub
   - Navigate to "Actions" tab
   - Enable GitHub Actions if not already enabled

2. **Configure Environment Variables** (when ready to deploy):

   - Go to repository Settings > Secrets and variables > Actions
   - Add necessary secrets:
     - `STAGING_API_KEY` (for staging deployment)
     - `PRODUCTION_API_KEY` (for production deployment)
     - `MONGODB_URI` (for database connection)
     - `JWT_SECRET` (for authentication)

3. **Customize Pipeline**:

   - Review `.github/workflows/ci-cd.yml`
   - Uncomment deployment steps when ready
   - Add your deployment commands
   - Configure environment-specific variables

4. **Monitor Pipeline**:
   - Check the "Actions" tab for build status
   - Review build logs for issues
   - Set up notifications for build failures

### Pipeline Best Practices

1. **Code Quality**:

   - Consider removing `continue-on-error` for production
   - Add test coverage requirements
   - Implement security scanning
   - Add performance benchmarks

2. **Deployment**:

   - Use blue-green deployment for zero downtime
   - Implement rollback procedures
   - Add deployment approvals for production
   - Monitor deployment health

3. **Security**:

   - Rotate secrets regularly
   - Use environment-specific variables
   - Implement dependency scanning
   - Add security policy checks

4. **Performance**:
   - Use caching for faster builds
   - Parallelize jobs where possible
   - Optimize build steps
   - Monitor build times

## 📁 Project Structure (Recommended)

```
mern-template/
├── backend/             # Backend Node.js/Express application
│   ├── src/
│   │   ├── config/                 # Configuration files
│   │   │   ├── database.ts        # Database configuration
│   │   │   ├── cors.ts           # CORS settings
│   │   │   └── env.ts            # Environment variables
│   │   │
│   │   ├── controllers/           # Route controllers
│   │   │   ├── auth.controller.ts
│   │   │   ├── user.controller.ts
│   │   │   └── ...
│   │   │
│   │   ├── middleware/            # Custom middleware
│   │   │   ├── auth.middleware.ts
│   │   │   ├── error.middleware.ts
│   │   │   └── validation.middleware.ts
│   │   │
│   │   ├── models/               # Database models
│   │   │   ├── user.model.ts
│   │   │   └── ...
│   │   │
│   │   ├── routes/              # API routes
│   │   │   ├── auth.routes.ts
│   │   │   ├── user.routes.ts
│   │   │   └── index.ts        # Route aggregator
│   │   │
│   │   ├── services/           # Business logic
│   │   │   ├── auth.service.ts
│   │   │   ├── user.service.ts
│   │   │   └── ...
│   │   │
│   │   ├── types/             # TypeScript type definitions
│   │   │   ├── user.types.ts
│   │   │   └── ...
│   │   │
│   │   ├── utils/             # Utility functions
│   │   │   ├── logger.ts
│   │   │   ├── validators.ts
│   │   │   └── helpers.ts
│   │   │
│   │   └── server.ts          # Application entry point
│   │
│   ├── tests/                 # Test files
│   │   ├── unit/
│   │   ├── integration/
│   │   └── e2e/
│   │
│   ├── logs/                  # Application logs
│   │
│   ├── docs/                  # API documentation
│   │
│   ├── scripts/              # Build/deployment scripts
│   │
│   ├── .env.example         # Example environment variables
│   │
│   ├── tsconfig.json        # TypeScript configuration
│   └── package.json         # Dependencies and scripts
│
├── frontend/           # Frontend React application
│   ├── src/
│   │   ├── assets/           # Static assets
│   │   │   ├── images/
│   │   │   ├── fonts/
│   │   │   └── styles/
│   │   │
│   │   ├── components/       # Reusable components
│   │   │   ├── common/      # Shared components
│   │   │   │   ├── Button/
│   │   │   │   ├── Input/
│   │   │   │   └── Modal/
│   │   │   │
│   │   │   │   ├── layout/      # Layout components
│   │   │   │   │   ├── Header/
│   │   │   │   │   ├── Footer/
│   │   │   │   │   └── Sidebar/
│   │   │   │   │
│   │   │   │   └── features/    # Feature-specific components
│   │   │   │
│   │   │   ├── hooks/           # Custom React hooks
│   │   │   │   ├── useAuth.ts
│   │   │   │   └── useForm.ts
│   │   │   │
│   │   │   ├── pages/           # Page components
│   │   │   │   ├── Home/
│   │   │   │   ├── Auth/
│   │   │   │   └── Dashboard/
│   │   │   │
│   │   │   ├── services/        # API services
│   │   │   │   ├── api.ts      # API client setup
│   │   │   │   ├── auth.service.ts
│   │   │   │   └── user.service.ts
│   │   │   │
│   │   │   ├── store/          # State management
│   │   │   │   ├── slices/
│   │   │   │   └── index.ts
│   │   │   │
│   │   │   ├── types/          # TypeScript types
│   │   │   │   ├── api.types.ts
│   │   │   │   └── models.types.ts
│   │   │   │
│   │   │   ├── utils/          # Utility functions
│   │   │   │   ├── formatters.ts
│   │   │   │   ├── validators.ts
│   │   │   │   └── helpers.ts
│   │   │   │
│   │   │   ├── constants/      # Constants and enums
│   │   │   │   ├── routes.ts
│   │   │   │   └── config.ts
│   │   │   │
│   │   │   └── App.tsx         # Root component
│   │   │   └── main.tsx        # Entry point
│   │   │   └── vite-env.d.ts   # Vite type declarations
│   │   │
│   │   └── public/             # Public static files
│   │
│   ├── tests/             # Test files
│   │   ├── unit/
│   │   ├── integration/
│   │   └── e2e/
│   │
│   ├── .env.example       # Example environment variables
│   ├── tsconfig.json     # TypeScript configuration
│   └── vite.config.ts    # Vite configuration
│
├── .github/           # GitHub configuration
│   └── workflows/     # CI/CD pipeline
│
├── .husky/           # Git hooks
├── setup.sh          # Setup script
└── package.json      # Root package.json
```

## 🛠️ Available Scripts

### Root Directory

```bash
npm run dev          # Start both frontend and backend
npm run dev:frontend # Start frontend only
npm run dev:backend  # Start backend only
npm run build        # Build both frontend and backend
npm run format       # Format code with Prettier
npm run lint         # Lint code with ESLint
npm run type-check   # Check TypeScript types
```

### Backend Directory

```bash
cd backend
npm run dev    # Start backend in development mode
npm run build  # Build backend
npm run start  # Start backend in production mode
```

### Frontend Directory

```bash
cd frontend
npm run dev    # Start frontend in development mode
npm run build  # Build frontend
npm run preview # Preview production build
```

## 🔧 Environment Setup

### Backend (.env)

```env
PORT=5000
MONGODB_URI=your_mongodb_uri
JWT_SECRET=your_jwt_secret
NODE_ENV=development
```

### Frontend (.env)

```env
VITE_API_URL=http://localhost:5000
```

## 📝 Development Tips

1. **Adding New Features**:

   - Create new components in `frontend/src/components`
   - Add new routes in `backend/src/routes`
   - Update environment variables if needed
   - Test changes locally before pushing

2. **Code Quality**:

   - Run `npm run format` before committing
   - Fix linting issues with `npm run lint`
   - Check types with `npm run type-check`
   - Commit messages are checked by Husky

3. **Database**:

   - Use MongoDB Atlas for production
   - Local MongoDB for development
   - Update `.env` files accordingly

4. **CI/CD Best Practices**:
   - Push to feature branches
   - Create pull requests to `main`
   - Check GitHub Actions status
   - Review build logs for issues

## 🔒 Git Hooks

This project uses Husky to manage Git hooks, ensuring code quality and consistency. Here's what each hook does:

### Available Hooks

1. **pre-commit** (Runs before each commit):

   ```bash
   # Checks
   - Type checking (TypeScript)
   - Code formatting (Prettier)
   - Linting (ESLint)
   ```

   This hook ensures that:

   - All TypeScript types are valid
   - Code is properly formatted
   - No linting errors exist
   - Only runs on staged files

2. **pre-push** (Runs before pushing to remote):

   ```bash
   # Checks
   - Build verification
   ```

   This hook ensures that:

   - The project builds successfully
   - No compilation errors exist
   - Code is ready for deployment

3. **commit-msg** (Runs after commit message is written):
   ```bash
   # Checks
   - Commit message format
   ```
   This hook ensures that:
   - Commit messages follow conventional format
   - Messages are descriptive and consistent
   - Better changelog generation

### Commit Message Format

Commit messages should follow the conventional format:

```
type(scope): subject

[optional body]

[optional footer]
```

Types:

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or modifying tests
- `chore`: Maintenance tasks

Examples:

```bash
# Feature
git commit -m "feat(auth): add user login functionality"

# Bug fix
git commit -m "fix(api): resolve user data fetching error"

# Documentation
git commit -m "docs(readme): update setup instructions"

# Style
git commit -m "style(components): format button component"
```

### Working with Hooks

1. **Skipping Hooks** (if needed):

   ```bash
   # Skip all hooks
   git commit -m "message" --no-verify

   # Skip specific hook
   HUSKY_SKIP_HOOKS=pre-push git push
   ```

2. **Troubleshooting**:

   - If hooks fail, fix the issues before committing
   - Check error messages for specific problems
   - Run checks manually if needed:

     ```bash
     # Type checking
     npm run type-check

     # Linting
     npm run lint

     # Formatting
     npm run format

     # Build
     npm run build
     ```

3. **Best Practices**:
   - Commit frequently with meaningful messages
   - Keep commits focused and atomic
   - Fix hook errors before bypassing
   - Review hook output for issues

## 🌿 Branch Strategy

This project follows a simple two-branch strategy:

### Branches

1. **main** (Production):

   - Stable, production-ready code
   - Protected branch
   - Only accepts merges from `develop`
   - Triggers production deployment (when configured)

2. **develop** (Development):
   - Active development branch
   - Feature branches merge here
   - Triggers staging deployment (when configured)
   - Used for testing and integration

### Workflow

1. **Starting New Features**:

   ```bash
   # Create and switch to a new feature branch
   git checkout develop
   git pull origin develop
   git checkout -b feature/your-feature-name
   ```

2. **Working on Features**:

   ```bash
   # Make your changes
   git add .
   git commit -m "feat(feature): your feature description"

   # Keep your branch updated
   git checkout develop
   git pull origin develop
   git checkout feature/your-feature-name
   git merge develop
   ```

3. **Merging Features**:

   ```bash
   # Push your feature branch
   git push origin feature/your-feature-name

   # Create a Pull Request to develop
   # After review and approval, merge to develop
   ```

4. **Releasing to Production**:
   ```bash
   # When ready to release
   git checkout main
   git pull origin main
   git merge develop
   git push origin main
   ```

### Best Practices

1. **Branch Naming**:

   - Feature branches: `feature/feature-name`
   - Bug fixes: `fix/bug-description`
   - Documentation: `docs/description`
   - Hotfixes: `hotfix/issue-description`

2. **Commit Messages**:

   - Follow conventional commit format
   - Be descriptive and clear
   - Reference issues if applicable

3. **Pull Requests**:

   - Create PRs for all changes
   - Include clear descriptions
   - Request reviews when needed
   - Address review comments

4. **Keeping Updated**:
   - Regularly pull from develop
   - Resolve conflicts early
   - Keep commits focused
   - Test before merging

## 🧪 Testing Guide

### When to Add Tests

1. **Start Adding Tests When You Have**:

   - API endpoints in your backend
   - React components with user interactions
   - Complex business logic
   - Database operations
   - Authentication/Authorization features

2. **Priority Order**:
   1. Critical user flows (login, signup, etc.)
   2. API endpoints
   3. Database operations
   4. Complex components
   5. Utility functions

### How to Add Tests

1. **Backend Testing Setup**:

   ```bash
   cd backend
   npm install --save-dev vitest @vitest/coverage-v8 supertest @types/supertest
   ```

   Add to `backend/package.json`:

   ```json
   {
     "scripts": {
       "test": "vitest",
       "test:coverage": "vitest run --coverage",
       "test:ui": "vitest --ui"
     }
   }
   ```

   Example API test (`backend/src/__tests__/api/auth.test.ts`):

   ```typescript
   import { describe, it, expect } from 'vitest';
   import request from 'supertest';
   import { app } from '../../src/app';

   describe('Auth API', () => {
     it('should register a new user', async () => {
       const response = await request(app).post('/api/auth/register').send({
         email: 'test@example.com',
         password: 'password123',
       });

       expect(response.status).toBe(201);
       expect(response.body).toHaveProperty('token');
     });
   });
   ```

2. **Frontend Testing Setup**:

   ```bash
   cd frontend
   npm install --save-dev vitest @vitest/coverage-v8 @testing-library/react @testing-library/user-event jsdom
   ```

   Add to `frontend/package.json`:

   ```json
   {
     "scripts": {
       "test": "vitest",
       "test:coverage": "vitest run --coverage",
       "test:ui": "vitest --ui"
     }
   }
   ```

   Example component test (`frontend/src/__tests__/components/LoginForm.test.tsx`):

   ```typescript
   import { describe, it, expect } from 'vitest';
   import { render, screen } from '@testing-library/react';
   import userEvent from '@testing-library/user-event';
   import { LoginForm } from '../../components/LoginForm';

   describe('LoginForm', () => {
     it('should show error for invalid email', async () => {
       render(<LoginForm />);

       const emailInput = screen.getByLabelText(/email/i);
       await userEvent.type(emailInput, 'invalid-email');

       const submitButton = screen.getByRole('button', { name: /login/i });
       await userEvent.click(submitButton);

       expect(screen.getByText(/invalid email/i)).toBeInTheDocument();
     });
   });
   ```

### Testing Best Practices

1. **Write Tests For**:

   - User interactions
   - API endpoints
   - Form validations
   - Error handling
   - Edge cases

2. **Test Structure**:

   ```
   backend/
   ├── src/
   │   ├── __tests__/
   │   │   ├── api/        # API endpoint tests
   │   │   ├── unit/       # Unit tests
   │   │   └── integration/# Integration tests

   frontend/
   ├── src/
   │   ├── __tests__/
   │   │   ├── components/ # Component tests
   │   │   ├── pages/     # Page tests
   │   │   └── hooks/     # Custom hooks tests
   ```

3. **Naming Conventions**:

   - Test files: `*.test.ts` or `*.test.tsx`
   - Test suites: `describe('Component/Feature Name', () => {})`
   - Test cases: `it('should do something specific', () => {})`

4. **Running Tests**:

   ```bash
   # Run all tests
   npm test

   # Run tests with coverage
   npm run test:coverage

   # Run tests in watch mode
   npm test -- --watch

   # Run specific test file
   npm test -- path/to/test.test.ts
   ```

### Common Testing Patterns

1. **API Testing**:

   - Test HTTP methods (GET, POST, PUT, DELETE)
   - Check response status codes
   - Validate response data
   - Test error cases

2. **Component Testing**:

   - Test user interactions
   - Check component rendering
   - Verify state changes
   - Test props and callbacks

3. **Database Testing**:
   - Use test database
   - Clean up after tests
   - Test CRUD operations
   - Verify data integrity

### Resources for Learning Testing

- [Vitest Documentation](https://vitest.dev/guide/)
- [React Testing Library](https://testing-library.com/docs/react-testing-library/intro/)
- [Supertest Documentation](https://github.com/visionmedia/supertest)
- [Testing Best Practices](https://kentcdodds.com/blog/common-mistakes-with-react-testing-library)

## 🎓 Learning Resources

- [MongoDB Documentation](https://docs.mongodb.com)
- [Express.js Guide](https://expressjs.com/guide/routing.html)
- [React Documentation](https://reactjs.org/docs/getting-started.html)
- [Node.js Documentation](https://nodejs.org/docs)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
