#!/bin/sh

export PGPASSWORD=mysecretpassword

psql --host localhost --port 5439 --username=postgres -d postgres <<EOF
DROP TABLE polls_foo;
EOF