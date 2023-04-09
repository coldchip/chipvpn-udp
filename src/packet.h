#ifndef PACKET_H
#define PACKET_H

typedef struct __attribute__((__packed__)) {
	uint8_t	version:4, ihl:4;
	uint8_t  ip_tos;
	uint16_t ip_len;
	uint16_t ip_id;
	uint16_t ip_off;
	uint8_t  ip_ttl;
	uint8_t  ip_p;
	uint16_t ip_sum;
	uint32_t src_addr;
	uint32_t dst_addr;
} ip_packet_t;

typedef struct __attribute__((__packed__)) {
	int type;
} chipvpn_packet_header_t;

typedef struct __attribute__((__packed__)) {
	int id;
} chipvpn_packet_auth_t;

typedef struct __attribute__((__packed__)) {
	char iv[16];
} chipvpn_packet_data_t;

typedef struct __attribute__((__packed__)) {
	int id;
} chipvpn_packet_ping_t;

typedef struct __attribute__((__packed__)) {
	chipvpn_packet_header_t header;
	union {
		chipvpn_packet_auth_t auth_header;
		chipvpn_packet_data_t data_header;
		chipvpn_packet_ping_t ping_header;
	};
	char data[5000];
} chipvpn_packet_t;

#endif