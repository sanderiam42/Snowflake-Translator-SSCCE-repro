use role ${service_role}; -- use the role here you used when creating the artifacts in the first steps so they have rights to grant access
grant usage on function "SAMPLE_DATABASE"."SAMPLE_SCHEMA"."SAMPLE_REQUEST_TRANSLATOR"(OBJECT) to role analyst;
grant usage on function "SAMPLE_DATABASE"."SAMPLE_SCHEMA"."SAMPLE_RESPONSE_TRANSLATOR"(OBJECT) to role analyst;
grant usage on schema "SAMPLE_DATABASE"."SAMPLE_SCHEMA" to role public;