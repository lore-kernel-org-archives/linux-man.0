From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: [PATCH 1/2 v3] adjtimex.2: add fields in struct timex description
Date: Sun, 30 Nov 2014 11:14:46 +0100
Message-ID: <547AEE16.20603@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

this is a refactored series of patches for adjtimex(2) man page. Please
ignore all previous patches I sent for adjtimex.2.

The first patch updates the man page with the new fields added in struct
timex since last edition of the man page.

Thank you for your time. These are my first patches so you may have to
bear with me being a little inexpert and clumsy for some time. I
apologize for that.

Laurent

diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index eb3fda1..0b919c5 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -73,6 +73,15 @@ struct timex {
                             (read-only) */
     struct timeval time; /* current time (read-only) */
     long tick;           /* usecs between clock ticks */
+    long ppsfreq;        /* pps frequency (scaled ppm) (read-only) */
+    long jitter;         /* pps jitter (usec) (read-only) */
+    int shift;           /* interval duration (sec) (read-only) */
+    long stabil;         /* pps stability (scaled ppm) (read-only) */
+    long jitcnt;         /* jitter limit exceeded (read-only) */
+    long calcnt;         /* calibration intervals (read-only) */
+    long errcnt;         /* calibration errors (read-only) */
+    long stbcnt;         /* stability limit exceeded (read-only) */
+    int tai;             /* TAI offset (s) (read-only) */
 };
 .fi
 .in
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
