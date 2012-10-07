From: Thomas Habets <thomas-NmolrwyTDqqzQB+pC5nmwQ@public.gmane.org>
Subject: PATCH: Change manpage of times(2) to recommend clock_gettime(2), not gettimeofday(2)
Date: Sun, 7 Oct 2012 22:37:32 +0100
Message-ID: <CA+kHd+d7WzVzCUbs2NA+9uVMGCeD9wgUMJ=h2WR1-8sb+e4DYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Change manpage of times(2) to recommend clock_gettime(2), not gettimeofday(2)

>From times(2):
  "To measure changes in elapsed time, use gettimeofday(2) instead."

>From gettimeofday(2):
  "POSIX.1-2008 marks gettimeofday() as obsolete, recomending  the
  use of clock_gettime(2) instead."

Some context, showing how use of gettimeofday() causes actual bugs
(also read comments):
http://blog.habets.pp.se/2010/09/gettimeofday-should-never-be-used-to-measure-time


diff --git a/man2/times.2 b/man2/times.2
index a37874e..020103a 100644
--- a/man2/times.2
+++ b/man2/times.2
@@ -174,7 +174,7 @@ combined with the fact that the returned value may overflow
 .IR clock_t ,
 means that a portable application would be wise to avoid using this value.
 To measure changes in elapsed time, use
-.BR gettimeofday (2)
+.BR clock_gettime (2)
 instead.
 .\" .PP
 .\" On older systems the number of clock ticks per second is given
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
