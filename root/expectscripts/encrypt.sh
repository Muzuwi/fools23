#!/usr/bin/env expect

set inputstring [lindex $argv 0];

spawn nc fools2023.online 13337
expect "Ready."

# Read the file contents
send "rf\n"
expect "Filename?"
send "REPORT03.PRG\n"
expect "address?"
send "2000\n"
expect "Ready."

# Execute the file
send "x\n"
expect "address?"
send "2000\n"
expect "Really exec"
send "Y\n"

expect "PASSWORD:"
send $inputstring
send "\n"

expect -- "\r\n--\r\n"
expect -- "\r\n--\r\n"
puts -nonewline [ open encrypted.bin w ] $expect_out(buffer)

expect "Ready."
interact

