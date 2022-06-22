FROM dart:stable as base

WORKDIR /usr/app

COPY ./services/recipes ./services/recipes

WORKDIR /usr/app/services/recipes

RUN dart pub get
    
FROM base as between

# Build a minimal serving image
RUN dart compile exe ./bin/recipes.dart -o ./bin/server

FROM scratch as prod

COPY --from=between /runtime/ /
COPY --from=between /usr/app/services/recipes/bin/server /usr/app/bin/

ENV SHELF_HOTRELOAD=false

CMD [ "/usr/app/bin/server" ]