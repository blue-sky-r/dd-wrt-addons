#!/bin/sh

# SNMP extension for DD-WRT - wireless noise floor [dBm] #
# if radio is not on
[ $(wl radio) != 0x0000 ] && echo "0" && exit
# radio is on - get noise (even if radio is off the noise is returned)
# $1 is optional offset to get positive numbers for mrtg (default 100)
let n=${1:-100}+$(wl noise)
echo $n
