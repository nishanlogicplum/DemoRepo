# Use the Python 3.10 image based on Alpine Linux as the base image
FROM python:3.10-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy all files from the current directory (on your host machine) to /app in the container
COPY . .

# Install system dependencies including Git
RUN apt-get update && apt-get install -y \
    cmake \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install any necessary Python packages specified in requirements.txt
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the default port that Streamlit uses (8501)
EXPOSE 8501

# Command to run application
CMD ["streamlit", "run", "app.py"]
