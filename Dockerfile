from alpine:latest
# Taking the talest image of alpine
maintainer Itay Ben-Hur itaybenhur@gmail.com
# Always a good practice to let people know how to contact you 
run apk update && apk add --no-cache python3 py3-pip && mkdir proj
# Running apk update, downloading & installing python3 to the container, making a project folder
workdir /proj
# Making /proj the workdir 
copy ./printchars.py .
# Copying the pre-written python program to /proj of the alpine instance
copy ./requirements.txt .
# Copying the pre-written requienments for flask text file to /proj of the alpine instance
run python3 -m venv .venv && . .venv/bin/activate && pip install -r requirements.txt
# Make a virtual enviroment, activateing it and installing requienments on venv.
cmd ["python3", "printchars.py"]
# This will execute the script when running the container
