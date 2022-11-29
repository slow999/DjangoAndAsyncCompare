!/bin/sh

export PGPASSWORD=mysecretpassword

psql --host localhost --port 5439 --username=postgres -d postgres <<EOF
CREATE TABLE polls_foo AS
SELECT * FROM GENERATE_SERIES(1, 50) AS id;
EOF