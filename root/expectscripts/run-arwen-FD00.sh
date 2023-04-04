#!/usr/bin/env expect

set inputstring [lindex $argv 0];

spawn nc fools2023.online 13338

expect "Username: "
send "ax.arwen\n"
expect "Password: "
send "sYpiB;705*X\n"
expect "Ready."

send "w\n"
expect "address?"
send "FD00\n"
expect "newline:"

send $inputstring
send ".\n"

# Execute the file
send "x\n"
expect "address?"
send "FD00\n"
expect "Really exec"
send "Y\n"

interact

