FROM dart:stable

WORKDIR /usr/app

# Resolve the local packages
COPY ./packages/validation ./packages/validation

COPY ./services/recipes ./services/recipes

WORKDIR /usr/app/services/recipes

RUN dart pub get