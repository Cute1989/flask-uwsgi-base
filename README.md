# flask-uwsgi-base   
## Intro
Docker base image
## Get it
```
docker pull cute18/python3-flask-uwsgi
```
## How to use
### Structure
#### folder tree
```
|--app
|    -- __init__.py
|    -- ... ...
|--Dockerfile
|--manager.py
|--uwsgi.ini
```
#### Dockerfile
```
FROM cute18/python3-flask-uwsgi
LABEL maintainer="ljy_coder@163.com"
COPY . .
EXPOSE 80
CMD ["uwsgi", "--ini","uwsgi.ini"]
```
#### uwsgi.ini
```
[uwsgi]
http = 0.0.0.0:80
pythonpath = /usr/local/lib/python3.6/site-packages
wsgi-file = /flask/manager.py    
callable = app 
touch-reload = /flask/
processes = 4
threads = 2
```
#### app folder
Your flask project
#### manager.py
The Entry file which include "app" 
```
from app import create_app
app = create_app()
```
### Docker Command
```
docker build -t DEMONAME .
docker run -p 80:80 -d DEMONAME
```
