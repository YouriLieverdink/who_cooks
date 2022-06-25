FROM dart:stable as base

WORKDIR /usr/app

# Resolve local dependencies
COPY ./packages/queue ./packages/queue

COPY ./services/schedules ./services/schedules

WORKDIR /usr/app/services/schedules

RUN dart pub get
    
FROM base as between

# Build a minimal serving image
RUN dart compile exe ./bin/schedules.dart -o ./bin/server

FROM scratch as prod

COPY --from=between /runtime/ /
COPY --from=between /usr/app/services/schedules/bin/server /usr/app/bin/

ENV SHELF_HOTRELOAD=false

CMD [ "/usr/app/bin/server" ]