From: Carsten Andrich <carsten.andrich-hs6bpBdVsEZfm0AUMx9V0g@public.gmane.org>
Subject: [patch] packet.7: PACKET_LOSS has inverse meaning
Date: Tue, 22 Apr 2014 18:01:59 +0200
Message-ID: <1398182519.2926.26.camel@x201>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-zKnNzTyzHyJfp2Hnzo6C"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--=-zKnNzTyzHyJfp2Hnzo6C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hey there,

I stumbled upon an error in packet.7 regarding the meaning of the
PACKET_LOSS socket option. According to the current git version of
linux-man setting PACKET_LOSS causes malformed packets to *not* be
silently dropped.

However it is the other way round. If PACKET_LOSS is *not* set,
malformed packets will be marked TP_STATUS_WRONG_FORMAT and the
transmission process aborted, leaving untransmitted packets in the ring.
If it *is* set, malformed packets will be silently skipped, their status
set to TP_STATUS_AVAILABLE and the transmission process continued with
the following packet.

This behaviour can be clearly seen in net/packet/af_packet.c:
http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/net/packet/af_packet.c#n2300

The value accompanying TP_PACKET_LOSS translates into po->tp_loss:
http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/net/packet/af_packet.c#n3304

I inverted the meaning of PACKET_LOSS and clarified the description in
the attached patch.

Cheers,
Carsten.


--=-zKnNzTyzHyJfp2Hnzo6C
Content-Disposition: attachment; filename="packet.7.patch"
Content-Type: text/x-patch; name="packet.7.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/man7/packet.7 b/man7/packet.7
index d8257f9..5085814 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -319,9 +319,15 @@ original fanout algorithm selects a backlogged socket, the packet
 rolls over to the next available one.
 .TP
 .BR PACKET_LOSS " (with " PACKET_TX_RING )
-If set, do not silently drop a packet on transmission error, but
-return it with status set to
-.BR TP_STATUS_WRONG_FORMAT .
+When a malformed packet is encountered on a transmit ring, the default is to
+set its status to
+.BR TP_STATUS_WRONG_FORMAT
+and abort the transmission immediately (it and following packets are left
+lingering on the ring). However if
+.BR PACKET_LOSS
+is set, malformed packets will be skipped, their status reset to
+.BR TP_STATUS_AVAILABLE
+and the transmission process continued.
 .TP
 .BR PACKET_RESERVE " (with " PACKET_RX_RING )
 By default, a packet receive ring writes packets immediately following the
@@ -419,7 +425,7 @@ or
 then that overrides the socket default.
 On successful transmission, the socket resets the slot to
 .BR TP_STATUS_AVAILABLE .
-It discards packets silently on error unless
+It immediately aborts the transmission on error unless
 .BR PACKET_LOSS
 is set.
 .TP

--=-zKnNzTyzHyJfp2Hnzo6C--

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
