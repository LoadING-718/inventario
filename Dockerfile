# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim
#EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

#RUN useradd --shell /bin/bash -u 1000 -g 1000 -m appuser \
    #&& chown -R appuser:app:productos /home/appuser

WORKDIR /app
WORKDIR ${inventario}
# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

#WORKDIR /app
#COPY . /app
COPY ./entrypoint.sh /app/entrypoint.sh
COPY . /app
RUN chmod +x entrypoint.sh

ENTRYPOINT ["sh", "/app/entrypoint.sh" ]


# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
#RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
#USER appuser
CMD ["/bin/bash"]
# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
#CMD ["gunicorn", "--bind", "0.0.0.0:8000", "inventario.wsgi"]
