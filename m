From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] syslog: document all type options
Date: Wed, 13 Feb 2008 11:18:31 +1100
Message-ID: <1202861911.426160.527338481577.qpush@pokey>
References: <1202861911.283156.369797917642.qpush@pokey>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1202861911.283156.369797917642.qpush@pokey>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The type=6 and above options to syslog aren't documented, so
add a sentence about each.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

---

 man2/syslog.2 |   33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

Index: man-pages-2.77/man2/syslog.2
===================================================================
--- man-pages-2.77.orig/man2/syslog.2
+++ man-pages-2.77/man2/syslog.2
@@ -115,6 +115,39 @@ The call
 .RI (5, dummy , idummy )
 only executes the "clear ring buffer" command.
 
+The call
+.BR syslog ()
+.RI (6, dummy , dummy )
+sets the console log level to minimum, so that no messages are printed
+to the console.
+
+The call
+.BR syslog ()
+.RI (7, dummy , dummy )
+sets the console log level to default, so that messages are printed
+to the console.
+
+The call
+.BR syslog ()
+.RI (8, dummy , level )
+sets the console log level to
+.IR level .
+Which is an integer between 1 and 8 (inclusive).
+See the
+.B loglevel
+section for details.
+
+The call
+.BR syslog ()
+.RI (9, dummy , dummy )
+queries and returns the number of bytes currently available to be read
+on the kernel log buffer.
+
+The call
+.BR syslog ()
+.RI (10, dummy , dummy )
+queries and returns the total size of the kernel log buffer.
+
 .B The loglevel
 .br
 The kernel routine
