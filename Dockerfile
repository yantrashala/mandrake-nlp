FROM python:2

MAINTAINER Siddhartha Lahiri "siddhartha.lahiri@gmail.com"

ENV RASA_NLU_DOCKER="YES"
ENV RASA_NLU_HOME=/app
ENV RASA_NLU_PYTHON_PACKAGES=/usr/local/lib/python2.7/dist-packages

RUN mkdir -p /app
RUN mkdir -p /usr/local/lib/python2.7/dist-packages

RUN git clone https://github.com/golastmile/rasa_nlu.git
RUN cp -r /rasa_nlu/* /app
RUN mkdir /app/data/mandrake

WORKDIR ${RASA_NLU_HOME}
RUN mkdir "/${RASA_NLU_HOME}/models"

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y --no-install-recommends build-essential
RUN apt-get install -y --no-install-recommends git-core
RUN apt-get install -y --no-install-recommends curl
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /rasa_nlu

RUN pip install gunicorn json-logging-py
RUN pip install -r "${RASA_NLU_HOME}/requirements.txt"
RUN pip install -U spacy
RUN pip install git+https://github.com/mit-nlp/MITIE.git
RUN python -m spacy download en
RUN python -m rasa_nlu.download -p mitie
RUN pip install -U scikit-learn
RUN python setup.py install

ADD ./gen-docs.sh /app/gen-docs.sh
RUN chmod 0755 /app/gen-docs.sh
