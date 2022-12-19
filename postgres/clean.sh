#!/bin/sh

export PGPASSWORD=mysecretpassword

psql --host localhost --port 8001 --username=postgres -d postgres <<EOF
DROP TABLE polls_foo;
EOF