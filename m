From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] syslog: Add type 10
Date: Wed, 13 Feb 2008 11:18:31 +1100
Message-ID: <1202861911.329926.179390617729.qpush@pokey>
References: <1202861911.283156.369797917642.qpush@pokey>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1202861911.283156.369797917642.qpush@pokey>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Since 2.6.6, we've had another type (10) option to the syslog syscall,
this change adds it to the syslog manpage.

Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>

---

 man2/syslog.2 |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

Index: man-pages-2.77/man2/syslog.2
===================================================================
--- man-pages-2.77.orig/man2/syslog.2
+++ man-pages-2.77/man2/syslog.2
@@ -66,19 +66,20 @@ Quoting from
  *      7 \-\- Enable printk's to console
  *      8 \-\- Set level of messages printed to console
  *      9 \-\- Return number of unread characters in the log buffer
+ *     10 \-\- Return size of the log buffer
  */
 .fi
 
-Only function 3 is allowed to non-root processes.
-(Function 9 was added in 2.4.10.)
+Only functions 3 and 10 are allowed to non-root processes.
+(Function 9 was added in 2.4.10, function 10 in 2.6.6)
 
 .B The kernel log buffer
 .br
 The kernel has a cyclic buffer of length
 .B LOG_BUF_LEN
 (4096, since 1.3.54: 8192, since 2.1.113: 16384; in recent kernels
-the size can be set at compile time) in which messages given as argument
-to the kernel function
+the size can be queried with function 10) in which messages given as
+argument to the kernel function
 .BR printk ()
 are stored
 (regardless of their loglevel).
