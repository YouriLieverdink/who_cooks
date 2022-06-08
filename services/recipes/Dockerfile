FROM dart:stable as base

WORKDIR /usr/app

# Resolve the local packages
COPY ./packages/validation ./packages/validation

COPY ./services/recipes ./services/recipes

WORKDIR /usr/app/services/recipes

RUN dart pub get

CMD [ "dart", "./bin/recipes.dart", "--enable-vm-service" ]
    
FROM base as prod

# Build a minimal serving image
RUN dart compile exe ./bin/recipes.dart -o ./bin/server

FROM scratch

COPY --from=base /runtime/ /
COPY --from=base /usr/app/services/recipes/bin/server /usr/app/bin/

RUN ls /usr/app/bin

CMD [ "/usr/app/bin/server" ]