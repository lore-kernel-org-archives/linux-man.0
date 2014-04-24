From: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Subject: [patch] getsockopt.2, packet.7: improve sockopt documentation for
 packet sockets
Date: Thu, 24 Apr 2014 18:14:17 +0200
Message-ID: <1398356057.1966.14.camel@x201.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello everyone,

building up on Stefan's and my patches and Daniel's useful hint
regarding filter.txt, I assembled this short patch.

It attempts to clarify the tp_status situtation, considering that zero
has a special meaning and most bits are actually mutually exclusive.

I added filter.txt and and Daniel's and Chetan's excellent
psock_tpacket.c (IIRC Michael has already done that, but not yet pushed
to the public git repo) to the "see also" section.
I also appended packet.7 to getsockopt.2's "see also" section.

Cheers,
Carsten


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
index d8257f9..1ffcf32 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -319,9 +319,20 @@ original fanout algorithm selects a backlogged socket, the packet
 rolls over to the next available one.
 .TP
 .BR PACKET_LOSS " (with " PACKET_TX_RING )
-If set, do not silently drop a packet on transmission error, but
-return it with status set to
-.BR TP_STATUS_WRONG_FORMAT .
+When a malformed packet is encountered on a transmit ring, the default is
+to reset its
+.I tp_status
+to
+.BR TP_STATUS_WRONG_FORMAT
+and abort the transmission immediately (it and following packets are left
+lingering on the ring).
+However if
+.BR PACKET_LOSS
+is set, any malformed packet will be skipped, its
+.I tp_status
+reset to
+.BR TP_STATUS_AVAILABLE
+and the transmission process continued.
 .TP
 .BR PACKET_RESERVE " (with " PACKET_RX_RING )
 By default, a packet receive ring writes packets immediately following the
@@ -353,15 +364,21 @@ Packet socket and application communicate the head and tail of the ring
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
-During normal operation, the new status is
-.BR TP_STATUS_USER ,
-to signal that a correctly received packet has been stored.
+During normal operation, the new
+.I tp_status
+value has at least the
+.BR TP_STATUS_USER
+bit set, to signal that a received packet has been stored.
 When the application has finished processing a packet, it transfers
-ownership of the slot back to the socket by setting the status to
+ownership of the slot back to the socket by setting
+.I tp_status
+equal to
 .BR TP_STATUS_KERNEL .
 Packet sockets implement multiple variants of the packet ring.
 The implementation details are described in
@@ -400,9 +417,13 @@ Create a memory-mapped ring buffer for packet transmission.
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
@@ -417,9 +438,11 @@ If an address is passed using
 or
 .BR sendmsg (2),
 then that overrides the socket default.
-On successful transmission, the socket resets the slot to
+On successful transmission, the socket resets
+.I tp_status
+to
 .BR TP_STATUS_AVAILABLE .
-It discards packets silently on error unless
+It immediately aborts the transmission on error unless
 .BR PACKET_LOSS
 is set.
 .TP
@@ -625,3 +648,12 @@ RFC\ 1700 for the IEEE 802.3 IP encapsulation.
 The
 .I <linux/if_ether.h>
 include file for physical layer protocols.
+
+The Linux kernel source tree.
+.IR /Documentation/networking/filter.txt
+describes how to apply Berkeley Packet Filters to packet sockets.
+.IR /tools/testing/selftests/net/psock_tpacket.c
+contains usage examples for all available versions of
+.BR PACKET_RX_RING
+and
+.BR PACKET_TX_RING .

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
