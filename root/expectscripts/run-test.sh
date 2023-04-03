#!/usr/bin/env expect

set inputstring [lindex $argv 0];

spawn nc fools2023.online 13337
expect "Ready."

# Read the file contents
send "rf\n"
expect "Filename?"
send "MATHTEST.PRG\n"
expect "address?"
send "2000\n"
expect "Ready."

# Execute the file
send "x\n"
expect "address?"
send "2000\n"
expect "Really exec"
send "Y\n"

interact

