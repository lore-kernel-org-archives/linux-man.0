From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] proc.5: tfix
Date: Wed, 13 May 2015 12:50:43 +0300
Message-ID: <55531E73.2020405@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


---
 man5/proc.5 |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index d0a7629..c3996eb 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -93,15 +93,15 @@ directories but their own (the
 .IR /proc/[pid]
 directories themselves remain visible).
 Sensitive files such as
-.IR /proc/[pid]cmdline
+.IR /proc/[pid]/cmdline
 and
-.IR /proc/[pid]status
+.IR /proc/[pid]/status
 are now protected against other users.
 This makes it impossible to learn whether any user is running a
 specific program
 (so long as the program doesn't otherwise reveal itself by its behavior).
 .\" As an additional bonus, since
-.\" .IR /proc/[pid]cmdline
+.\" .IR /proc/[pid]/cmdline
 .\" is unaccessible for other users,
 .\" poorly written programs passing sensitive information via
 .\" program arguments are now protected against local eavesdroppers.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
