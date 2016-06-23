FROM showtimeanalytics/alpine-base:3.4
MAINTAINER Alberto Gregoris <alberto@showtimeanalytics.com>

ADD root /
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
