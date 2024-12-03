# Start with Python 3.10 slim image
FROM python:3.10-slim

RUN apt-get update && apt-get install -y libsndfile1

# Set working directory in the container
WORKDIR /app

# Copy requirements file
COPY requirements_frozen.txt .

# Install dependencies
RUN pip install -r requirements_frozen.txt

# Copy all files from current directory to container
COPY . .

# Expose ports needed for FastAPI and Streamlit
EXPOSE 8000
# EXPOSE 8501

# Command to run FastAPI using Uvicorn
CMD ["uvicorn", "api_real_models:app", "--host", "0.0.0.0", "--port", "8000"]
