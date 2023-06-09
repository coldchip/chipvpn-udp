#!/bin/bash

up() {
	while ! ping -c 1 -W 1 1.1.1.1; do
		echo "waiting for network..."
		sleep 1
	done

	ip=$(ip route show default | awk '/default/ {print $3}' | tr -cd '[a-zA-Z0-9]._-')

	echo "adding routes"
	ip route add 157.245.205.9 via $ip
	ip route add 0.0.0.0/1 via 10.128.0.1
	ip route add 128.0.0.0/1 via 10.128.0.1
}

down() {
	ip=$(ip route show default | awk '/default/ {print $3}' | tr -cd '[a-zA-Z0-9]._-')
	
	echo "deleting routes"
	ip route del 157.245.205.9 via $ip
	ip route del 0.0.0.0/1 via 10.128.0.1
	ip route del 128.0.0.0/1 via 10.128.0.1
}

"$@"

exit 0
