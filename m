From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] syslog: document new return values
Date: Wed, 13 Feb 2008 11:37:13 +1100
Message-ID: <1202863033.777067.227449740820.qpush@pokey>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

.. also, add entries for type==9 and type==10 to the RETURN VALUES
section.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

---

 man2/syslog.2 |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

Index: man-pages-2.77/man2/syslog.2
===================================================================
--- man-pages-2.77.orig/man2/syslog.2
+++ man-pages-2.77/man2/syslog.2
@@ -195,7 +195,12 @@ Otherwise,
 for \fItype\fP equal to 2, 3 or 4,
 .BR syslog ()
 returns the number
-of bytes read, and otherwise 0.
+of bytes read,
+for \fItype\fP equal to 9,
+the number of number of unread characters in the log buffer,
+for \fItype\fP equal to 10,
+the total size of the log buffer,
+and otherwise 0.
 .SH ERRORS
 .TP
 .B EINVAL
