#!/bin/bash

ip=$(ip route show default | awk '/default/ {print $3}' | tr -cd '[a-zA-Z0-9]._-')

up() {
	echo "adding routes"
	ip route add 3.0.7.3 via $ip
	ip route add 0.0.0.0/1 via 10.0.2.1
	ip route add 128.0.0.0/1 via 10.0.2.1
}

down() {
	echo "deleting routes"
	ip route del 3.0.7.3 via $ip
	ip route del 0.0.0.0/1 via 10.0.2.1
	ip route del 128.0.0.0/1 via 10.0.2.1
}

"$@"

exit 0
