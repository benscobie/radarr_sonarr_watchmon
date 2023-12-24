FROM oznu/s6-alpine:3.12

ENV \
    # Fail if cont-init scripts exit with non-zero code.
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    CRON="0 * * * *"

COPY requirements.txt /
RUN apk add --update --no-cache python3 \
 && rm -rf /var/cache/* \
 && mkdir /var/cache/apk \
 && ln -sf python3 /usr/bin/python \
 && python -m ensurepip \
 && pip3 install --no-cache-dir --upgrade pip \
 && pip3 install --no-cache-dir -r requirements.txt

COPY root/ /
COPY radarr_sonarr_watchmon.py /radarr_sonarr_watchmon.py