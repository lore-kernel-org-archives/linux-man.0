From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] locale.5: add iconv(1) reference
Date: Wed, 13 May 2015 11:50:25 +0300
Message-ID: <55531051.3080305@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

one more tweak to locale(5) page, since it now describes transliteration
let's add a reference to iconv(1) which has an example how it works and
how it can be tested.

---
 man5/locale.5 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/man5/locale.5 b/man5/locale.5
index a1b94be..40c360e 100644
--- a/man5/locale.5
+++ b/man5/locale.5
@@ -1236,6 +1236,7 @@ This manual page isn't complete.
 .\" .SH AUTHOR
 .\" Jochen Hein (Hein-SVAqIv1tV6Auki3NsKDZl5HjxUfvIkdz@public.gmane.org)
 .SH SEE ALSO
+.BR iconv (1),
 .BR locale (1),
 .BR localedef (1),
 .BR localeconv (3),

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
