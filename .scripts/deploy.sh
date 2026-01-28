#!/bin/bash

set -e

echo "Starting deployment..."

# Navigate to root directory
cd /var/www/github_action_with_django

# Activate virtual environment
source env/bin/activate

# Pull latest code
echo "Pulling latest code from git..."
git pull origin main

# Navigate to project directory
cd github_actions_projects

# Install/update dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Collect static files
echo "Serving statif files..."
python manage.py collectstatic --noinput

# Run migrations
echo "Running database migrations..."
python manage.py makemigrations
python manage.py migrate

# Deactivate virtual environment
deactivate
echo "Virtual environ deactivated..."

echo "Deployment completed successfully!"