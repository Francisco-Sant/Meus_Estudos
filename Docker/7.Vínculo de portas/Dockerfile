FROM python:3.9 
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
ADD . /code
WORKDIR /code
CMD ["python", "app.py"]
EXPOSE 5000