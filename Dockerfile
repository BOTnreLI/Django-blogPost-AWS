# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the Docker image
WORKDIR /code

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends gcc libpq-dev

# Install Python dependencies
COPY ./mysite/req.txt /code/
RUN pip install --no-cache-dir -r req.txt

# Copy the current directory contents into the container at /code/
COPY ./mysite /code/

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "mysite.wsgi:application"]
