#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp design_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY  ./static /home/labs/static/" >> tempdir/Dockerfile
echo "COPY  ./templates /home/labs/templates/" >> tempdir/Dockerfile
echo "COPY  midterm_app.py /home/labs/" >> tempdir/Dockerfile
echo "EXPOSE 5000" >> tempdir/Dockerfile
echo "CMD python /home/labs/midterm_app.py" >> tempdir/Dockerfile

cd tempdir
docker build -t testapp .
docker run -t -d -p 5000:5000 --name designrun testapp
docker ps -a