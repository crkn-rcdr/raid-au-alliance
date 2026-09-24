-- Grant the runtime API user access to the api_svc schema.
--
-- api_user is created before Flyway migration runs.
-- This migration grants api_user the permissions required by raid-api
-- for existing tables/sequences and sets default privileges for objects
-- created by future migrations.

GRANT USAGE ON SCHEMA api_svc TO api_user;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA api_svc
TO api_user;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA api_svc
TO api_user;

-- Ensure tables created by future migrations receive the same privileges.
ALTER DEFAULT PRIVILEGES IN SCHEMA api_svc
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO api_user;

-- Ensure sequences created by future migrations receive the required privileges.
ALTER DEFAULT PRIVILEGES IN SCHEMA api_svc
GRANT USAGE, SELECT ON SEQUENCES TO api_user;