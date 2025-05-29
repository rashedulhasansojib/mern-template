#!/bin/bash

# MERN Stack Project Setup Script
# A beginner-friendly script to set up your MERN project

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Welcome message
echo -e "\n${GREEN}🚀 Welcome to MERN Stack Project Setup!${NC}"
echo "This script will help you set up your project step by step."
echo "========================================================"

# Check requirements
print_status "Checking requirements..."

# Check Node.js
if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed. Please install Node.js first."
    echo "Visit: https://nodejs.org/"
    exit 1
fi

# Check npm
if ! command -v npm &> /dev/null; then
    print_error "npm is not installed. Please install npm first."
    exit 1
fi

print_success "Node.js $(node --version) and npm $(npm --version) are installed"
echo

# Get project information
print_status "Let's set up your project..."

# Get project name
read -p "Enter your project name (e.g., my-awesome-app): " PROJECT_NAME
PROJECT_NAME=$(echo $PROJECT_NAME | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Get MongoDB URI
read -p "Enter your MongoDB URI (default: mongodb://localhost:27017/$PROJECT_NAME): " MONGODB_URI
MONGODB_URI=${MONGODB_URI:-"mongodb://localhost:27017/$PROJECT_NAME"}

# Generate secure JWT secret
JWT_SECRET=$(openssl rand -base64 32)

# Create environment files
print_status "Creating environment files..."

# Backend .env
cat > backend/.env << EOL
# Server Configuration
PORT=5000
NODE_ENV=development

# Database Configuration
MONGODB_URI=$MONGODB_URI

# Security
JWT_SECRET=$JWT_SECRET
JWT_EXPIRES_IN=7d

# CORS
CORS_ORIGIN=http://localhost:3000
EOL

# Frontend .env
cat > frontend/.env << EOL
# API Configuration
VITE_API_URL=http://localhost:5000/api
VITE_API_TIMEOUT=5000

# Feature Flags
VITE_ENABLE_DEBUG_MODE=false
EOL

print_success "Environment files created"
echo

# Update package.json
print_status "Updating project configuration..."
sed -i "s/\"name\": \"mern-template\"/\"name\": \"$PROJECT_NAME\"/" package.json
sed -i "s/\"description\": \"MERN Stack Template with ESLint, Prettier, and Husky\"/\"description\": \"$PROJECT_NAME - A MERN Stack Application\"/" package.json
print_success "Project configuration updated"
echo

# Install dependencies
print_status "Installing dependencies (this might take a few minutes)..."
echo "Installing root dependencies..."
npm install

echo "Installing backend dependencies..."
cd backend && npm install && cd ..

echo "Installing frontend dependencies..."
cd frontend && npm install && cd ..

print_success "All dependencies installed"
echo

# Initialize git
print_status "Setting up git repository..."
rm -rf .git
git init
git add .
git commit -m "Initial commit: Project setup from MERN template"
print_success "Git repository initialized"
echo

# Final success message
echo "========================================================"
print_success "🎉 Your MERN project is ready!"
echo
print_status "Next steps:"
echo "1. Start development:"
echo "   ${YELLOW}npm run dev${NC}"
echo "   - Frontend will be at http://localhost:3000"
echo "   - Backend will be at http://localhost:5000"
echo
echo "2. Basic commands:"
echo "   ${YELLOW}npm run dev${NC}    - Start development servers"
echo "   ${YELLOW}npm run build${NC}  - Build for production"
echo "   ${YELLOW}npm run lint${NC}   - Check code quality"
echo "   ${YELLOW}npm run format${NC} - Format your code"
echo
echo "3. Important files:"
echo "   - ${YELLOW}backend/.env${NC}    - Backend configuration"
echo "   - ${YELLOW}frontend/.env${NC}   - Frontend configuration"
echo "   - ${YELLOW}README.md${NC}       - Project documentation"
echo
print_status "Happy coding! 🚀"
echo "========================================================" 