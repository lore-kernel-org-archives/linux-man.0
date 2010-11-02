From: =?ISO-8859-1?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Subject: [patch] ip.7: Tiny style fix
Date: Mon, 01 Nov 2010 23:21:15 -0400
Message-ID: <iao03c$77p$1@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Here is a trivial patch to fix a bold dot that shouldn't be bold (sorry
that I didn't check this one better).


diff --git a/man7/ip.7 b/man7/ip.7
index 821fa11..4561b2f 100644
--- a/man7/ip.7
+++ b/man7/ip.7
@@ -41,7 +41,7 @@ For more information on sockets, see
 An IP socket is created by calling the
 .BR socket (2)
 function as
-.BI "socket(AF_INET, " socket_type ", " protocol ) \fP.
+.BI "socket(AF_INET, " socket_type ", " protocol ) \fR.
 Valid socket types are
 .B SOCK_STREAM
 to open a


Regards

David


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
