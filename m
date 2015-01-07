From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memchr, strstr: Reference memmem (3) in SEE ALSO section
Date: Wed, 07 Jan 2015 12:39:40 +0100
Message-ID: <54AD1AFC.7000900@gmail.com>
References: <CAP737oKh=Pv_SX560fXeTHyC7zRXqC5kctvtvvo2dKKbs_cDZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAP737oKh=Pv_SX560fXeTHyC7zRXqC5kctvtvvo2dKKbs_cDZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Bique <bique.alexandre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/21/2012 05:41 PM, Alexandre Bique wrote:
> Hi,
> 
> This patch references the memmem (3) function in memchr and strstr SEE
> ALSO section.

Thanks, Alexandre. Applied.

Cheers,

Michael



---
 man3/memchr.3 |    1 +
 man3/strstr.3 |    1 +
 2 files changed, 2 insertions(+)

diff --git a/man3/memchr.3 b/man3/memchr.3
index 82fd5b4..6320810 100644
--- a/man3/memchr.3
+++ b/man3/memchr.3
@@ -134,6 +134,7 @@ function is a GNU extension, available since glibc 2.1.
 .SH "SEE ALSO"
 .BR ffs (3),
 .BR index (3),
+.BR memmem (3),
 .BR rindex (3),
 .BR strchr (3),
 .BR strpbrk (3),
diff --git a/man3/strstr.3 b/man3/strstr.3
index 3aa9053..8130cd0 100644
--- a/man3/strstr.3
+++ b/man3/strstr.3
@@ -74,6 +74,7 @@ and return \fIhaystack\fP when \fIneedle\fP is empty.
 .SH "SEE ALSO"
 .BR index (3),
 .BR memchr (3),
+.BR memmem (3),
 .BR rindex (3),
 .BR strcasecmp (3),
 .BR strchr (3),
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
