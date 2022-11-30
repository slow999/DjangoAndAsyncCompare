#!/bin/sh

export PGPASSWORD=mysecretpassword

psql --host localhost --port 5439 --username=postgres -d postgres <<EOF
CREATE TABLE polls_foo AS
SELECT * FROM GENERATE_SERIES(1, 1000000) AS id;
EOF