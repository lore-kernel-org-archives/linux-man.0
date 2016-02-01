From: Eric Dumazet <eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ip.7: add IP_BIND_ADDRESS_NO_PORT description
Date: Mon, 01 Feb 2016 15:35:22 -0800
Message-ID: <1454369722.7627.191.camel@edumazet-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

From: Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Documentation for IP_BIND_ADDRESS_NO_PORT socket option
added in linux-4.2
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=90c337da1524863838658078ec34241f45d8394d

Signed-off-by: Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
---
 man7/ip.7 |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man7/ip.7 b/man7/ip.7
index 1c51a50..f8d4e63 100644
--- a/man7/ip.7
+++ b/man7/ip.7
@@ -338,6 +338,11 @@ application wants to receive data from.
 This option can be used multiple times to allow
 receiving data from more than one source.
 .TP
+.BR IP_BIND_ADDRESS_NO_PORT " (since Linux 4.2)
+Instruct kernel to not reserve an ephemeral port at bind() time.
+The port will be automatically chosen at connect() time, in a way
+that allows sharing a source port as long as the 4-tuples are unique.
+.TP
 .BR IP_BLOCK_SOURCE " (since Linux 2.4.22 / 2.5.68)"
 Stop receiving multicast data from a specific source in a given group.
 This is valid only after the application has subscribed


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
