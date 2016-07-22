FROM alpine

EXPOSE 8000

RUN apk --no-cache add \
  python py-pip ca-certificates

ADD . /pokelocater

WORKDIR /pokelocater

RUN pip install -r requirements.txt

ENV GMAPS_API_KEY "my_google_maps_api_key"
ENV GOOG_USERNAME "my_google_username"
ENV GOOG_PASSWORD "my_google_password"
ENV PTC_USERNAME "my_pokeclub_username"
ENV PTC_PASSWORD "my_pokeclub_password"

ENTRYPOINT ["python","manage.py","runserver","0.0.0.0:8000"]
