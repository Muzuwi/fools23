#!/usr/bin/env expect

set inputstring [lindex $argv 0];

spawn nc fools2023.online 13337
expect "Ready."

send "w\n"
expect "address?"
send "1000\n"
expect "newline:"

send $inputstring
send ".\n"

# Execute the file
send "x\n"
expect "address?"
send "1000\n"
expect "Really exec"
send "Y\n"

set timeout 2
expect "*** BREAK INTO MONITOR AT "
expect "Ready."
set outputfilename [ format "swi/swi-%s.log" $inputstring ]
puts -nonewline [ open $outputfilename w ] $expect_out(buffer)

send eof

