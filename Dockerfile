# Use a lightweight Python base image
FROM python:3.12-slim

# Set the working directory inside the container
WORKDIR /app

# Install necessary system packages
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the application code to the working directory
COPY . /app/

# Upgrade pip and install required Python packages
RUN pip install --upgrade pip setuptools wheel \
    && pip install -r requirements.txt

# Expose the application port
EXPOSE 8080

# Define the command to run the application
CMD ["python", "main.py"]
