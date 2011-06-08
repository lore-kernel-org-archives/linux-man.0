From: Eric Gouriou <egouriou-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] fallocate.2: mention <linux/falloc.h> for flag definitions
Date: Wed,  8 Jun 2011 15:17:33 -0700
Message-ID: <1307571453-29756-1-git-send-email-egouriou@google.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Chinner <dchinner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Nauman Rafique <nauman-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Eric Gouriou <egouriou-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Document that <linux/falloc.h> is needed to have the definition
of FALLOC_FL_* flags.
---
Notes:
1) <linux/falloc.h> also defines fallocate(), so one does not have
to include <fcntl.h> or define _GNU_SOURCE when <linux/falloc.h> is used.
However it is true that including <fcntl.h> defines fallocate() if and only
if _GNU_SOURCE is defined.

Please let me know if this kind of minutiae deserves to be noted in
the page. If so, please direct me to other pages I could use as guides
on how to convey such subtleties.

2) Currently only FALLOC_FL_KEEP_SIZE is defined. In progress patches
may add FALLOC_FL_PUNCH_HOLE when they land.
---
 man2/fallocate.2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 42eefbd..963c39f 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -9,6 +9,7 @@ fallocate \- manipulate file space
 .nf
 .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
 .B #include <fcntl.h>
+.BR "#include <linux/falloc.h>" "       /* For FALLOC_FL_* definitions */"
 
 .BI "int fallocate(int " fd ", int " mode ", off_t " offset \
 ", off_t " len ");
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
