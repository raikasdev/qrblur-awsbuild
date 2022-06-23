FROM ubuntu:22.04

WORKDIR /home/app
# Copy function code
COPY . /home/app

# Install the function's dependencies using file requirements.txt
# from your project folder.
RUN apt install python3
RUN apt install zbar
RUN pip3 install -r requirements.txt

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "lambda_function.lambda_handler" ] 