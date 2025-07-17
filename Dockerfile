#

FROM python:3.13-slim

# Set the working directory to /app.
WORKDIR /app

# Copy the current directory contents into the container at /app.
COPY . /app

# Installation de nodejs
RUN apt-get update && apt-get install -qy nodejs npm

# Install any needed packages specified in requirements.txt.
RUN pip install --no-cache-dir -r requirements.txt 

# Define a command for running the application.
CMD ["myst", "start"]