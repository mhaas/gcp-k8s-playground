FROM python:3.6.4

USER nobody

RUN git clone https://github.com/JoelKronander/TensorFlask.git tensorflask \
    && cd tensorflask \
    && git checkout aa3140b47ba781f6f0df908292e750004c4e9b83

WORKDIR /var/tensorflask

USER ROOT

RUN pip3 install numpy \
    && pip3 install -r requirements.txt \
    && rm -rf /root/.cache/pip/

USER nobody

EXPOSE 8000

CMD gunicorn server_application:app
