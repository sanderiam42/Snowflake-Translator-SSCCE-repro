CREATE ROLE ANALYST;
GRANT usage ON database SAMPLE_DATABASE to ROLE ANALYST;
GRANT usage on schema SAMPLE_DATABASE.PUBLIC to role ANALYST;
GRANT ALL ON ALL TABLES IN SCHEMA SAMPLE_DATABASE.PUBLIC to role ANALYST;

/*
After establishing the role and its permissions, the next step is to assign the role to a user. 
This ensures that the specified user has the access rights provided by the role. Make sure to 
replace ${your_user} with your actual username
*/
grant role analyst to user ${your_user};