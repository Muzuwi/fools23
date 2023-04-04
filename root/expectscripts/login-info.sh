#!/usr/bin/env expect

set inputstring [lindex $argv 0];

spawn nc fools2023.online 13339

expect "characters):"
send "\360\266\373\n"
expect "Welcome"

interact

