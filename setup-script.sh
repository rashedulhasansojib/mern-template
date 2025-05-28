#!/bin/bash

# MERN Stack Project Setup Script
# This script installs dependencies for root, backend, and frontend

set -e  # Exit on any error

echo "🚀 Starting MERN Stack Project Setup..."
echo "========================================"

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

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    print_error "npm is not installed. Please install npm first."
    exit 1
fi

print_status "Node.js version: $(node --version)"
print_status "npm version: $(npm --version)"
echo

# Install root dependencies
print_status "Installing root dependencies..."
if npm install; then
    print_success "Root dependencies installed successfully"
else
    print_error "Failed to install root dependencies"
    exit 1
fi
echo

# Install backend dependencies
print_status "Installing backend dependencies..."
if [ -d "backend" ]; then
    if cd backend && npm install && cd ..; then
        print_success "Backend dependencies installed successfully"
    else
        print_error "Failed to install backend dependencies"
        exit 1
    fi
else
    print_warning "Backend directory not found, skipping backend dependencies"
fi
echo

# Install frontend dependencies
print_status "Installing frontend dependencies..."
if [ -d "frontend" ]; then
    if cd frontend && npm install && cd ..; then
        print_success "Frontend dependencies installed successfully"
    else
        print_error "Failed to install frontend dependencies"
        exit 1
    fi
else
    print_warning "Frontend directory not found, skipping frontend dependencies"
fi
echo

# Initialize husky
print_status "Initializing Husky..."
if npx husky install; then
    print_success "Husky initialized successfully"
else
    print_warning "Husky initialization failed or already initialized"
fi
echo

# Check if git is initialized
if [ ! -d ".git" ]; then
    print_warning "Git repository not initialized. Run 'git init' to enable git hooks."
fi

# Final success message
echo "========================================"
print_success "🎉 MERN Stack Project Setup Complete!"
echo
print_status "Next steps:"
echo "  1. Run 'npm run dev' to start both frontend and backend"
echo "  2. Run 'npm run lint' to check code quality"
echo "  3. Run 'npm run format' to format your code"
echo "  4. Make your first commit to test the git hooks"
echo
print_status "Available scripts:"
echo "  • npm run dev          - Start both frontend and backend"
echo "  • npm run build        - Build both applications"
echo "  • npm run lint         - Lint all code"
echo "  • npm run lint:fix     - Fix linting issues"
echo "  • npm run format       - Format all code"
echo "  • npm run type-check   - Check TypeScript types"
echo "  • npm run test         - Run all tests"
echo "========================================"