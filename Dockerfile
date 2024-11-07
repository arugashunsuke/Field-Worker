# Use a base image with Python
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the application code
COPY . .

# Run the application on port 8080
ENV PORT 8080
CMD ["gunicorn", "-b", ":8080", "app:app"]