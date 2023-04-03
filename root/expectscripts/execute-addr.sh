#!/usr/bin/env expect

set inputstring [lindex $argv 0];

spawn nc fools2023.online 13337
expect "Ready."

# Execute the address 
send "x\n"
expect "address?"
send $inputstring
send "\n"
expect "Really exec"
send "Y\n"

set timeout 2
set outputfilename [ format "bios/jump-%s.log" $inputstring ]
expect {
	"Ready" {
		exp_continue
	}
	"ILLEGAL OPCODE" {
		exp_continue
	}

}
puts -nonewline [ open $outputfilename w ] $expect_out(buffer)
send eof

