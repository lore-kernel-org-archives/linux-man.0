From: Alberto Bertogli <albertito-vOTlzuNH1/1M3YmQoIpPTg@public.gmane.org>
Subject: [PATCH] getrlimit.2: Note the side-effects of setting RLIMIT_STACK to RLIM_INFINITY
Date: Sat, 17 Jul 2010 01:11:04 -0300
Message-ID: <1279339864-7203-1-git-send-email-albertito@blitiri.com.ar>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alberto Bertogli <albertito-vOTlzuNH1/1M3YmQoIpPTg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Since 2.6.25 (commit cc503c1b4), setting RLIMIT_STACK to RLIM_INFINITY has the
side-effect of making the kernel use the old vm layout, which can be also be
selected manually by setting the personality flag ADDR_COMPAT_LAYOUT.

The details of the old vs. new layout can be found at
http://lwn.net/Articles/90311/.

Signed-off-by: Alberto Bertogli <albertito-vOTlzuNH1/1M3YmQoIpPTg@public.gmane.org>
---

Hi!

I just found this behaviour and I thought a note was appropriate for the man
page.

While it shouldn't be noticeable for most cases, I just hit a bug triggered by
it, so it's not _that_ strange.

Thanks a lot,
		Alberto


 man2/getrlimit.2 |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
index 35c9eed..b9df581 100644
--- a/man2/getrlimit.2
+++ b/man2/getrlimit.2
@@ -360,6 +360,15 @@ Since Linux 2.6.23,
 this limit also determines the amount of space used for the process's
 command-line arguments and environment variables; for details, see
 .BR execve (2).
+Since Linux 2.6.25, if set to
+.B RLIM_INFINITY
+then as a side-effect this limit changes the way the kernel selects the layout
+of the addresses returned by
+.BR mmap (2),
+as if the ADDR_COMPAT_LAYOUT personality
+flag was enabled. This should not be noticeable to most applications.
+.\" from arch/x86/mm/mmap.c:mmap_is_legacy(), introduced by commit cc503c1b
+
 .SH "RETURN VALUE"
 On success, zero is returned.
 On error, \-1 is returned, and
-- 
1.7.1.755.geb6f2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
