From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Patch: signalfd(2) typo
Date: Sat, 07 Jun 2008 13:31:47 -0400
Message-ID: <cone.1212859907.312748.21450.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: linux-man@vger.kernel.org



--- man-pages-2.80/man2/signalfd.2~	2008-06-03 05:50:15.000000000 -0400
+++ man-pages-2.80/man2/signalfd.2	2008-06-07 13:27:31.000000000 -0400
@@ -168,7 +168,7 @@
 .\" ssi_trapno is unused on most (all?) arches?
     int32_t  ssi_status;  /* Exit status or signal (SIGCHLD) */
     int32_t  ssi_int;     /* Integer sent by sigqueue(2) */
-    uint64_t ssi_ptr      /* Pointer sent by sigqueue(2) */;
+    uint64_t ssi_ptr;     /* Pointer sent by sigqueue(2) */
     uint64_t ssi_utime;   /* User CPU time consumed (SIGCHLD) */
     uint64_t ssi_stime;   /* System CPU time consumed (SIGCHLD) */
     uint64_t ssi_addr;    /* Address that generated signal

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
