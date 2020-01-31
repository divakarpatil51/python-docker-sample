# Minimal Linux image from docker hub
# First Layer of Image
FROM alpine:latest

# Build up the image we are creating. For every RUN, a new layer is created
# Second Layer of Image
RUN apk add --update py3-pip && pip3 install --upgrade pip

COPY requirements.txt /usr/src/app/

# Fourth Layer of Image
RUN pip3 install --no-cache-dir -r /usr/src/app/requirements.txt

COPY templates/index.html /usr/src/app/templates/
COPY app.py /usr/src/app/

EXPOSE 5000

CMD ["python3", "/usr/src/app/app.py"]
