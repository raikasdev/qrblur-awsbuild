FROM public.ecr.aws/lambda/python:3.9

# Copy function code
COPY . ${LAMBDA_TASK_ROOT}

# Install the function's dependencies using file requirements.txt
# from your project folder.
RUN yum -y install https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/g/GraphicsMagick-1.3.38-1.el7.x86_64.rpm
RUN yum -y install https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/z/zbar-0.10-27.el7.x86_64.rpm
RUN sudo yum install mesa-libGL -y
COPY requirements.txt  .
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "lambda_function.lambda_handler" ] 