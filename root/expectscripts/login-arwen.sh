#!/usr/bin/env expect

set inputstring [lindex $argv 0];

spawn nc fools2023.online 13338

expect "Username: "
send "ax.arwen\n"
expect "Password: "
send "sYpiB;705*X\n"
expect "Ready."

interact






