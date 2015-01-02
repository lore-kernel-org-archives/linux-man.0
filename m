From: Jeff Epler <jepler-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>
Subject: [PATCH] adjtimex: PPM scaling is by 2^-16
Date: Thu, 1 Jan 2015 20:41:20 -0600
Message-ID: <20150102024118.GA8293@unpythonic.net>
References: <54A2DEAD.2050708@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54A2DEAD.2050708-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Jeff Epler <jepler-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>
---
Like Laurent Georget, I found by reading ntpd source
the scale is 2^16 (i.e., 1 ~= 1.5e-5 ppm, 65536 = 1ppm)

Perhaps a wording like the following is suitable.

 man2/adjtimex.2 | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index 4b558b7..118908a 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -54,9 +54,8 @@ struct timex {
     long offset;      /* Time offset; nanoseconds, if STA_NANO
                          status flag is set, otherwise
                          microseconds */
-    long freq;        /* Frequency offset, as scaled PPM
+    long freq;        /* Frequency offset, in units of 2^-16 PPM
                          (parts per million) */
-.\" FIXME What is the scaling unit of timex.freq?  2^16 ?
     long maxerror;    /* Maximum error (microseconds) */
     long esterror;    /* Estimated error (microseconds) */
     int  status;      /* Clock command/status */
@@ -72,13 +71,13 @@ struct timex {
                          flag is set, otherwise microseconds */
     long tick;        /* Microseconds between clock ticks */
     long ppsfreq;     /* PPS (pulse per second) frequency
-                         (scaled PPM, read-only) */
+                         (2^-16 PPM, read-only) */
     long jitter;      /* PPS jitter (read-only); nanoseconds, if
                          STA_NANO status flag is set, otherwise
                          microseconds */
     int  shift;       /* PPS interval duration
                          (seconds, read-only) */
-    long stabil;      /* PPS stability (scaled PPM, read-only) */
+    long stabil;      /* PPS stability (2^-16 PPM, read-only) */
     long jitcnt;      /* PPS jitter limit exceeded (read-only) */
     long calcnt;      /* PPS calibration intervals (read-only) */
     long errcnt;      /* PPS calibration errors (read-only) */
-- 
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
