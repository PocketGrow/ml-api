FROM python:3.10.9

WORKDIR /app

COPY requirements.txt /app/

COPY interest_rate_model /app/interest_rate_model
COPY gold_model /app/gold_model
COPY housepricegrowth_rate_model /app/housepricegrowth_rate_model
COPY stock_model /app/stock_model

COPY app.py /app/

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 5000

ENV FLASK_APP=app.py
ENV INTEREST_PATH=./interest_rate_model
ENV GOLD_PATH=./gold_model

CMD ["flask", "run", "--host=0.0.0.0"]