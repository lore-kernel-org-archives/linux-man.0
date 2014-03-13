From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] packet.7: PACKET_TX_RING packet status is a bitmap; explain TP_STATUS_LOSING
Date: Thu, 13 Mar 2014 17:58:11 +0200
Message-ID: <CACKs7VBh6NaNmb4nZT9E4hDSCwuiPqRBRiLebWVEDDcjHZtqVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

The context for this patch can be found in this email I sent to the
list a few weeks ago. It's the same patch with a description of
TP_STATUS_LOSING added:

http://article.gmane.org/gmane.linux.man/5145

As far as I can tell from LXR, the code hasn't changed in the latest
version (3.13.5) - tpacket_rcv() seems to be where the receive logic
is for PACKET_RX_RING. The bit map behavior seems to be ancient - it
was there in 2.6.7 as far as I can tell.

diff --git a/man7/packet.7 b/man7/packet.7
index d8257f9..187da08 100644
--- a/man7/packet.7
+++ b/man7/packet.7
@@ -357,9 +357,13 @@ The packet socket owns all slots with status
 .BR TP_STATUS_KERNEL .
 After filling a slot, it changes the status of the slot to transfer
 ownership to the application.
-During normal operation, the new status is
-.BR TP_STATUS_USER ,
-to signal that a correctly received packet has been stored.
+During normal operation, the new status has the
+.BR TP_STATUS_USER
+bit set to signal that a correctly received packet has been stored.
+If the status has the
+.BR TP_STATUS_LOSING
+bit set, it means the kernel has dropped packets due to lack of
+space in the ring.
 When the application has finished processing a packet, it transfers
 ownership of the slot back to the socket by setting the status to
 .BR TP_STATUS_KERNEL .

Thanks,
Stefan.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
