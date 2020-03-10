FROM python:3.7.3-stretch

COPY requirements.txt /tmp/

WORKDIR /home/jovyan/

RUN pip install pipenv
RUN pipenv lock --requirements > requirements.txt

RUN pip install --trusted-host pypi.python.org -r /tmp/requirements.txt
RUN pip install jupyter

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
