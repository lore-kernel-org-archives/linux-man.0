From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] adjtimex.2: fix kernel version references
Date: Fri, 07 Oct 2016 15:21:33 +0200
Message-ID: <1475846493.2878.26.camel@redhat.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

ADJ_SETOFFSET mode was added in 2.6.39:
$ git tag --contains 094aa1881fdc1b8889b442eb3511b31f3ec2b762 | head -n 1
v2.6.39

ADJ_MICRO and ADJ_NANO modes were added in 2.6.26:
$ git tag --contains eea83d896e318bda54be2d2770d2c5d6668d11db | head -n 1
v2.6.26

Signed-off-by: Nikola Forró <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 man2/adjtimex.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/adjtimex.2 b/man2/adjtimex.2
index a81b91f..0fd6273 100644
--- a/man2/adjtimex.2
+++ b/man2/adjtimex.2
@@ -146,7 +146,7 @@ If the
 .B STA_NANO
 status flag (see below) is clear, the kernel adds 4 to this value.
 .TP
-.BR ADJ_SETOFFSET " (since Linux 2.6.29)"
+.BR ADJ_SETOFFSET " (since Linux 2.6.39)"
 .\" commit 094aa1881fdc1b8889b442eb3511b31f3ec2b762
 .\" Author: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 Add
@@ -161,12 +161,12 @@ flag, then
 is interpreted as a nanosecond value;
 otherwise it is interpreted as microseconds.
 .TP
-.BR ADJ_MICRO " (since Linux 2.6.36)"
+.BR ADJ_MICRO " (since Linux 2.6.26)"
 .\" commit eea83d896e318bda54be2d2770d2c5d6668d11db
 .\" Author: Roman Zippel <zippel-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
 Select microsecond resolution.
 .TP
-.BR ADJ_NANO " (since Linux 2.6.36)"
+.BR ADJ_NANO " (since Linux 2.6.26)"
 .\" commit eea83d896e318bda54be2d2770d2c5d6668d11db
 .\" Author: Roman Zippel <zippel-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
 Select nanosecond resolution.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
