From: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Subject: Re: [patch] getsockopt.2, packet.7: improve sockopt documentation
 for packet sockets
Date: Mon, 28 Apr 2014 20:12:30 +0200
Message-ID: <1398708750.2988.18.camel@actium.fritz.box>
References: <1398356057.1966.14.camel@x201.fritz.box>
	 <20140425110218.GA14074@hmsreliant.think-freely.org>
	 <1398465760.6683.33.camel@actium.fritz.box>
	 <20140428133444.GD16041@hmsreliant.think-freely.org>
	 <1398698632.2988.10.camel@actium.fritz.box>
	 <20140428172815.GG16041@hmsreliant.think-freely.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140428172815.GG16041-B26myB8xz7F8NnZeBjwnZQMhkBWG/bsMQH7oEaQurus@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Horman <nhorman-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Willem de Bruijn <willemb-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Am Montag, den 28.04.2014, 13:28 -0400 schrieb Neil Horman:
> Rather than 'lingernig' perhaps more exact language to indicate that positive
> action is required from the application.  Perhaps:
> 
> Packets in the WRONG_FORMAT state block the kernel from sending it and subsequent
> packets on the ring.  Packet in the WRONG_FORMAT state must be moved to the
> AVAILABLE or SEND_REQUEST state (after correcting format errors), so that the
> next application call to send() properly transmits the frame.

Thanks for the suggestion! I incorporated it into the following updated
PACKET_LOSS description:
When a malformed packet is encountered on a transmit ring, the default
is to reset its tp_status to TP_STATUS_WRONG_FORMAT and abort the
transmission immediately.  The malformed  packet  blocks  itself  and
subsequent enqueued  packets from being sent.  The format error must be
fixed, the associated tp_status reset to TP_STATUS_SEND_REQUEST and the
transmission process restarted via send(2).  However, if PACKET_LOSS is
set, any malformed packet will be skipped, its tp_status reset to
TP_STATUS_AVAILABLE, and the transmission process continued.

IMHO this should go into the PACKET_TX_RING description, but I'd like to
defer that until I have a little more spare time on my hands, so I can
tackle the entire PACKET_MMAP-related part of the man-page in a single
effort.

Updated patch follows.

Cheers,
Carsten


diff --git a/man2/getsockopt.2 b/man2/getsockopt.2
index 925fa90..1287efc 100644
--- a/man2/getsockopt.2
+++ b/man2/getsockopt.2
@@ -41,7 +41,7 @@
 .\" Modified 1999 by Andi Kleen <ak-h9bWGtP8wOw@public.gmane.org>.
 .\"     Removed most stuff because it is in socket.7 now.
 .\"
-.TH GETSOCKOPT 2 2014-01-24 "Linux" "Linux Programmer's Manual"
+.TH GETSOCKOPT 2 2014-04-28 "Linux" "Linux Programmer's Manual"
 .SH NAME
 getsockopt, setsockopt \- get and set options on sockets
 .SH SYNOPSIS
@@ -205,6 +205,7 @@ system.
 .BR getprotoent (3),
 .BR protocols (5),
 .BR ip (7),
+.BR packet (7),
 .BR socket (7),
 .BR tcp (7),
 .BR udp (7),
diff --git a/man7/packet.7 b/man7/packet.7
index 11bca48..fc5fdaf 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -9,7 +9,7 @@
 .\"
 .\" $Id: packet.7,v 1.13 2000/08/14 08:03:45 ak Exp $
 .\"
-.TH PACKET  7 2014-04-24 "Linux" "Linux Programmer's Manual"
+.TH PACKET  7 2014-04-28 "Linux" "Linux Programmer's Manual"
 .SH NAME
 packet \- packet interface on device level
 .SH SYNOPSIS
@@ -319,14 +319,25 @@ original fanout algorithm selects a backlogged socket, the packet
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
-and abort the transmission immediately (it and following packets are left
-lingering on the ring).
+and abort the transmission immediately.
+The malformed packet blocks itself and subsequent enqueued packets from
+being sent.
+The format error must be fixed, the associated
+.I tp_status
+reset to
+.BR TP_STATUS_SEND_REQUEST
+and the transmission process restarted via
+.BR send (2) .
 However, if
 .BR PACKET_LOSS
-is set, any malformed packet will be skipped, its status reset to
+is set, any malformed packet will be skipped, its
+.I tp_status
+reset to
 .BR TP_STATUS_AVAILABLE ,
 and the transmission process continued.
 .TP
@@ -360,15 +371,21 @@ Packet socket and application communicate the head and tail of the ring
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
@@ -407,9 +424,13 @@ Create a memory-mapped ring buffer for packet transmission.
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
@@ -424,7 +445,9 @@ If an address is passed using
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
@@ -633,6 +656,11 @@ The
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

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
