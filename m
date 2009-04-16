From: Gokdeniz Karadag <gokdenizk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: incomplete si_codes for waitid(2) [patch available]
Date: Thu, 16 Apr 2009 19:11:20 +0300
Message-ID: <49E758A8.1080406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

In a program I was debugging, waitid(2) returned a strange value in siginfo_t
structure's si_code field. It was different that those stated in the man page
for waitid(2) [ waitid(2) man page is the same as wait(2) ].

When I looked at the relevant file "/usr/include/bits/siginfo.h" there were two
more values for si_code:

 CLD_DUMPED,                   /* Child terminated abnormally.  */
 CLD_TRAPPED,                  /* Traced child has trapped.  */

I was getting CLD_DUMPED value along with core dumps so I state that as an
example in the patch.  I'm not sure about how a process can get CLD_TRAPPED but
I include it for completeness' sake.

The diff applies to today's git version.

============================== diff ======================

diff --git a/man2/wait.2 b/man2/wait.2
index c95ff2c..4028fae 100644
--- a/man2/wait.2
+++ b/man2/wait.2
@@ -310,6 +310,10 @@ Set to one of:
 .BR _exit (2));
 .B CLD_KILLED
 (child killed by signal);
+.B CLD_DUMPED
+(child terminated abnormally, ie. core dump);
+.B CLD_TRAPPED
+(child has trapped while being traced);
 .B CLD_STOPPED
 (child stopped by signal); or
 .B CLD_CONTINUED

==========================================================


-- 
Gokdeniz Karadag

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
