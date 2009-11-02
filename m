From: Urs Thuermann <urs-5sm3ckEb1NlYFmeL5InDC7NAH6kLmebB@public.gmane.org>
Subject: [patch] strftime.3: ISO week number can be 52, add example
Date: 02 Nov 2009 16:02:44 +0100
Message-ID: <ygf1vkhrmuj.fsf@janus.isnogud.escape.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

A year cannot only begin with week number 53 of the previous year but
also with week number 52.  Year 2011 is an example for this case, as
can be easily seen with GNU date:

$ date -d "jan 1 2011" "+%c %V %G"
Sat Jan  1 00:00:00 2011 52 2010

This patch is against the current man-pages git repository.

urs



diff --git a/man3/strftime.3 b/man3/strftime.3
index 8dfe58c..a516979 100644
--- a/man3/strftime.3
+++ b/man3/strftime.3
@@ -360,13 +360,15 @@ the first week of the year that contains a Thursday;
 or, the week that has 4 January in it).
 When three of fewer days of the first calendar week of the new year fall
 within that year,
-then the ISO 8601 week-based system counts those days as part of week 53
-of the preceding year.
+then the ISO 8601 week-based system counts those days as part of week 52
+or 53 of the preceding year.
 For example, 1 January 2010 is a Friday,
 meaning that just three days of that calendar week fall in 2010.
 Thus, the ISO\ 8601 week-based system considers these days to be part of
 week 53 (\fB%V\fP) of the year 2009 (\fB%G\fP) ;
 week 01 of ISO\ 8601 year 2010 starts on Monday, 4 January 2010.
+Similarly, the first two days of January 2011 are considered to be part
+of week 52 of the year 2010.
 .SS Glibc Notes
 Glibc provides some extensions for conversion specifications.
 (These extensions are not specified in POSIX.1-2001, but a few other
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
