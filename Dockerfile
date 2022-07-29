# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.10-slim

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Install production dependencies.
RUN pip3 install --no-cache-dir -r requirements.txt


RUN python3 -m pip install --upgrade pip setuptools wheel
RUN pip3 install "uvicorn[standard]"

CMD exec uvicorn --port 8000 --host 0.0.0.0 main:app
#CMD [ "python", "./main.py" ]