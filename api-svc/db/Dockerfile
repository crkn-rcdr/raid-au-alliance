FROM gradle:8.14.3-jdk17

WORKDIR /workspace

COPY --chown=gradle:gradle . .

RUN gradle --version --no-daemon \
  && gradle :api-svc:db:processResources --no-daemon

CMD ["gradle", "-DRAIDO_APISVC_DB_CONFIG_PATH=/config/api-svc-db.gradle", ":api-svc:db:flywayMigrate", "--no-daemon"]
