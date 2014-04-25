From: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Subject: Re: [patch] getsockopt.2, packet.7: improve sockopt documentation
 for packet sockets
Date: Sat, 26 Apr 2014 00:42:40 +0200
Message-ID: <1398465760.6683.33.camel@actium.fritz.box>
References: <1398356057.1966.14.camel@x201.fritz.box>
	 <20140425110218.GA14074@hmsreliant.think-freely.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-SkYhvEpvfwAsz4QsbSJK"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140425110218.GA14074-B26myB8xz7F8NnZeBjwnZQMhkBWG/bsMQH7oEaQurus@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--=-SkYhvEpvfwAsz4QsbSJK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Freitag, den 25.04.2014, 07:02 -0400 schrieb Neil Horman:
> On Thu, Apr 24, 2014 at 06:14:17PM +0200, Carsten Andrich wrote:
> [...]
> > +When a malformed packet is encountered on a transmit ring, the default is
> > +to reset its
> > +.I tp_status
> > +to
> > +.BR TP_STATUS_WRONG_FORMAT
> > +and abort the transmission immediately (it and following packets are left
> > +lingering on the ring).
> 
> I'm not sure this is 100% clear.  Any of these error status flags leave the
> packet in memory on the ring.  WRONG_FORMAT, doesn't do anything special here.

The RX-related flags simply denote additional information, which are not
essential for RX ring operation, i.e. it won't hurt you if you ignore
them.

TP_STATUS_WRONG_FORMAT is different. It's only set if the transmission
process is aborted by the kernel. If this occurs the sendto()-call will
return EINVAL. In this case you have to walk the ring backwards from the
current userspace frame pointer, look for a frame with tp_status ==
TP_STATUS_WRONG_FORMAT, fix it and set its tp_status =
TP_STATUS_SEND_REQUEST. I assume PACKET_LOSS was introduced to obviate
the need to do this.

This should qualify TP_STATUS_WRONG_FORMAT as special. This behaviour
probably deserves a little more detail in the man-page, but I'll defer
that until the general overhaul takes place.

I've hacked up a demonstration and attached it.
Sorry, I'm a freedom-fighter against the 80-character-oppression :)

I also updated my patch for merge-less application to current
git-master:

diff --git a/man2/getsockopt.2 b/man2/getsockopt.2
index 925fa90..151cd31 100644
--- a/man2/getsockopt.2
+++ b/man2/getsockopt.2
@@ -205,6 +205,7 @@ system.
 .BR getprotoent (3),
 .BR protocols (5),
 .BR ip (7),
+.BR packet (7),
 .BR socket (7),
 .BR tcp (7),
 .BR udp (7),
diff --git a/man7/packet.7 b/man7/packet.7
index 11bca48..667568a 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -319,14 +319,18 @@ original fanout algorithm selects a backlogged socket, the packet
 rolls over to the next available one.
 .TP
 .BR PACKET_LOSS " (with " PACKET_TX_RING )
-When a malformed packet is encountered on a transmit ring, the default is to
-set its status to
+When a malformed packet is encountered on a transmit ring, the default is
+to reset its
+.I tp_status
+to
 .BR TP_STATUS_WRONG_FORMAT
 and abort the transmission immediately (it and following packets are left
 lingering on the ring).
 However, if
 .BR PACKET_LOSS
-is set, any malformed packet will be skipped, its status reset to
+is set, any malformed packet will be skipped, its
+.I tp_status
+reset to
 .BR TP_STATUS_AVAILABLE ,
 and the transmission process continued.
 .TP
@@ -360,15 +364,21 @@ Packet socket and application communicate the head and tail of the ring
 through the
 .I tp_status
 field.
-The packet socket owns all slots with status
+The packet socket owns all slots with
+.I tp_status
+equal to
 .BR TP_STATUS_KERNEL .
 After filling a slot, it changes the status of the slot to transfer
 ownership to the application.
-During normal operation, the new status has the
+During normal operation, the new
+.I tp_status
+value has at least the
 .BR TP_STATUS_USER
 bit set to signal that a received packet has been stored.
 When the application has finished processing a packet, it transfers
-ownership of the slot back to the socket by setting the status to
+ownership of the slot back to the socket by setting
+.I tp_status
+equal to
 .BR TP_STATUS_KERNEL .
 Packet sockets implement multiple variants of the packet ring.
 The implementation details are described in
@@ -407,9 +417,13 @@ Create a memory-mapped ring buffer for packet transmission.
 This option is similar to
 .BR PACKET_RX_RING
 and takes the same arguments.
-The application writes packets into slots with status
+The application writes packets into slots with
+.I tp_status
+equal to
 .BR TP_STATUS_AVAILABLE
-and schedules them for transmission by changing the status to
+and schedules them for transmission by changing
+.I tp_status
+to
 .BR TP_STATUS_SEND_REQUEST .
 When packets are ready to be transmitted, the application calls
 .BR send (2)
@@ -424,7 +438,9 @@ If an address is passed using
 or
 .BR sendmsg (2),
 then that overrides the socket default.
-On successful transmission, the socket resets the slot to
+On successful transmission, the socket resets
+.I tp_status
+to
 .BR TP_STATUS_AVAILABLE .
 It immediately aborts the transmission on error unless
 .BR PACKET_LOSS
@@ -633,6 +649,11 @@ The
 .I <linux/if_ether.h>
 include file for physical layer protocols.
 
-The example source file
+The Linux kernel source tree.
+.IR /Documentation/networking/filter.txt
+describes how to apply Berkeley Packet Filters to packet sockets.
 .IR /tools/testing/selftests/net/psock_tpacket.c
-in the Linux kernel source tree.
+contains example source code for all available versions of
+.BR PACKET_RX_RING
+and
+.BR PACKET_TX_RING .

--=-SkYhvEpvfwAsz4QsbSJK
Content-Disposition: attachment; filename="packet_mmap_send.c"
Content-Type: text/x-csrc; name="packet_mmap_send.c"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

/*
 * Copyright (c) 2014 Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */ 

#include <arpa/inet.h>
#include <err.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <net/if.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <unistd.h>

#define ERR_DEFAULT 1
#define FRAME_SIZE  2048
#define FRAME_COUNT 16
#define RING_SIZE (FRAME_COUNT * FRAME_SIZE)
#define IFNAME "p2p1"

#define FRAME_DATA "\xFF\xFF\xFF\xFF\xFF\xFF\x00\x00\x00\x00\x00\x00\xDE\xAD"

union frame {
	struct tpacket2_hdr tphdr;
    uint8_t _reserved[FRAME_SIZE];
};

static int sockfd;

static void *init_socket(void)
{
	if ((sockfd = socket(AF_PACKET, SOCK_RAW, 0)) == -1)
		err(ERR_DEFAULT, "socket() error");

	static struct sockaddr_ll bindaddr;
	bindaddr.sll_family   = AF_PACKET;
	bindaddr.sll_protocol = 0;
	bindaddr.sll_ifindex  = if_nametoindex(IFNAME);
	if (bind(sockfd, (struct sockaddr *) &bindaddr, (socklen_t) sizeof(bindaddr)) == -1)
		err(ERR_DEFAULT, "bind() error");
	
	static const int version = TPACKET_V2;
	if (setsockopt(sockfd, SOL_PACKET, PACKET_VERSION, &version, sizeof(version)) == -1)
		err(ERR_DEFAULT, "setsockopt() error");
	
	static const struct tpacket_req ringbuf_alloc = {
		.tp_block_size = RING_SIZE,
		.tp_frame_size = FRAME_SIZE,
		.tp_block_nr   = 1,
		.tp_frame_nr   = FRAME_COUNT
	};
	if (setsockopt(sockfd, SOL_PACKET, PACKET_TX_RING, (void *) &ringbuf_alloc, sizeof(ringbuf_alloc)) == -1)
		err(ERR_DEFAULT, "setsockopt() error");
    
	void *addr;
	if ((addr = mmap(NULL, RING_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, sockfd, 0)) == MAP_FAILED)
		err(ERR_DEFAULT, "mmap() error");
	
	return addr;
}

static union frame *frame_first, *frame_cur;

static char *status2name(uint32_t status)
{
	switch (status) {
	case TP_STATUS_AVAILABLE:
		return "AVAILABLE";
	case TP_STATUS_SEND_REQUEST:
		return "SEND_REQUEST";
	case TP_STATUS_SENDING:
		return "SENDING";
	case TP_STATUS_WRONG_FORMAT:
		return "WRONG_FORMAT";
	default:
		return "UNKNOWN";
	}
}

static void dump_frames(void)
{
	for (int i = 0; i < FRAME_COUNT; i += 8) {
		printf("%2d: %-16s %-16s %-16s %-16s\n", i,
			status2name((frame_first + i + 0)->tphdr.tp_status),
			status2name((frame_first + i + 1)->tphdr.tp_status),
			status2name((frame_first + i + 2)->tphdr.tp_status),
			status2name((frame_first + i + 3)->tphdr.tp_status)
		);
	}
	
	printf("\n");
}

static void enqueue_frame(void *data, size_t size)
{
	uint8_t *frame_payload = (uint8_t *) &frame_cur->tphdr + TPACKET2_HDRLEN - sizeof(struct sockaddr_ll);
	memcpy(frame_payload, data, size);
	
	frame_cur->tphdr.tp_len = size;
	frame_cur->tphdr.tp_status = TP_STATUS_SEND_REQUEST;
	
	if (frame_cur++ == frame_first + FRAME_COUNT)
		frame_cur = frame_first;
}

int main()
{
	frame_first = frame_cur = init_socket();
	
	uint8_t data[64];
	memset(data, 0, sizeof(data));
	memcpy(data, FRAME_DATA, sizeof(FRAME_DATA));
	
	// enqueue a few frames with different data
	data[59] = '0';
	enqueue_frame(data, 60);
	data[59] = '1';
	enqueue_frame(data, 60);
	data[59] = '2';
	enqueue_frame(data, 60);
	data[59] = '3';
	enqueue_frame(data, 60);
	data[59] = '4';
	enqueue_frame(data, 60);
	
	// corrupt frame #2 to trigger kernel TX error
	(frame_first + 2)->tphdr.tp_len = -1;
	
	dump_frames();
	sleep(1);
	
	// sendto() fails due to malformed frame #2
	if (sendto(sockfd, NULL, 0, MSG_DONTWAIT, NULL, 0) == -1)
		warn("sendto() error");
	
	// sendto() succeeds (but does nothing), since kernel aborted at frame #2
	// and its tp_status != TP_STATUS_SEND_REQUEST
	if (sendto(sockfd, NULL, 0, MSG_DONTWAIT, NULL, 0) == -1)
		warn("sendto() error");
	
	dump_frames();
	sleep(1);
	
	// repair frame #2 (its behind(!) frame_cur: frame_first+2 == frame_cur-3)
	(frame_first + 2)->tphdr.tp_len = 60;
	(frame_first + 2)->tphdr.tp_status = TP_STATUS_SEND_REQUEST;
	
	// sendto() succeeds and sends remaing frames
	if (sendto(sockfd, NULL, 0, MSG_DONTWAIT, NULL, 0) == -1)
		warn("sendto() error");
	
	dump_frames();
	
	close(sockfd);
	
	return 0;
}

--=-SkYhvEpvfwAsz4QsbSJK--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
