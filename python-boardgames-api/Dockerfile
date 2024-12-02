# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV POETRY_VERSION=1.1.11

# Install Poetry
RUN pip install "poetry==$POETRY_VERSION"

# Set the working directory in the container
WORKDIR /app

# Copy the pyproject.toml and poetry.lock files
COPY pyproject.toml poetry.lock ./

# Install the dependencies
RUN poetry install --no-root --no-dev

# Copy the rest of the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 5001

# Define the command to run the application
CMD ["poetry", "run", "python", "main.py"]