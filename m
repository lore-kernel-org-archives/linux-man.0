From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/3] syslog: printk isn't posessive, or a contraction
Date: Wed, 13 Feb 2008 11:18:31 +1100
Message-ID: <1202861911.382843.426327550231.qpush@pokey>
References: <1202861911.283156.369797917642.qpush@pokey>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1202861911.283156.369797917642.qpush@pokey>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

.. so we don't need the apostrophe. We probably don't need the 's'
either.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

---

 man2/syslog.2 |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: man-pages-2.77/man2/syslog.2
===================================================================
--- man-pages-2.77.orig/man2/syslog.2
+++ man-pages-2.77/man2/syslog.2
@@ -62,8 +62,8 @@ Quoting from
  *      3 \-\- Read up to the last 4k of messages in the ring buffer.
  *      4 \-\- Read and clear last 4k of messages in the ring buffer
  *      5 \-\- Clear ring buffer.
- *      6 \-\- Disable printk's to console
- *      7 \-\- Enable printk's to console
+ *      6 \-\- Disable printk to console
+ *      7 \-\- Enable printk to console
  *      8 \-\- Set level of messages printed to console
  *      9 \-\- Return number of unread characters in the log buffer
  *     10 \-\- Return size of the log buffer
