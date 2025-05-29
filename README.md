# MERN Stack Monorepo Template

A modern, beginner-friendly MERN (MongoDB, Express.js, React, Node.js) stack template with a monorepo structure. This template includes ESLint, Prettier, and Husky for code quality, along with a simple CI/CD pipeline.

## 🚀 Quick Start

### Prerequisites

- Node.js (v18 or higher)
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

This project includes a simple CI/CD pipeline that runs on GitHub Actions. Here's how it works:

### Pipeline Steps

1. **Trigger**: Runs on:

   - Push to `main` branch
   - Pull requests to `main` branch

2. **Build Process**:
   - Installs dependencies
   - Checks code format
   - Runs linting
   - Performs type checking
   - Builds the application

### Setting Up CI/CD

1. **Enable GitHub Actions**:

   - Go to your repository on GitHub
   - Click on "Actions" tab
   - Enable GitHub Actions if not already enabled

2. **Configure Environment Variables** (when ready to deploy):

   - Go to repository Settings > Secrets and variables > Actions
   - Add necessary secrets:
     - `STAGING_API_KEY` (for staging deployment)
     - `PRODUCTION_API_KEY` (for production deployment)

3. **Monitor Pipeline**:
   - Check the "Actions" tab in your repository
   - View build logs and status
   - Fix any issues that arise

### Pipeline Features

- ✅ Automatic builds on push/PR
- ✅ Code quality checks (format, lint, types)
- ✅ Dependency caching
- ✅ Build verification
- 🔄 Deployment ready (commented out)

## 📁 Project Structure

```
mern-template/
├── backend/             # Backend Node.js/Express application
│   ├── src/
│   │   ├── controllers/ # Route controllers
│   │   ├── models/      # Database models
│   │   ├── routes/      # API routes
│   │   └── index.js     # Entry point
│   ├── .env            # Backend environment variables
│   └── package.json    # Backend dependencies
│
├── frontend/           # Frontend React application
│   ├── src/
│   │   ├── components/ # React components
│   │   ├── pages/      # Page components
│   │   └── App.jsx     # Root component
│   ├── .env           # Frontend environment variables
│   └── package.json   # Frontend dependencies
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
