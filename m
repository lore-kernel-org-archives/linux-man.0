From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] setlocale.3: update CONFORMING TO
Date: Tue, 09 Jun 2015 17:18:16 +0300
Message-ID: <5576F5A8.50409@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

a tiny update to setlocale's CONFORMING TO section.

http://pubs.opengroup.org/onlinepubs/9699919799/functions/setlocale.html
---
 man3/setlocale.3 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man3/setlocale.3 b/man3/setlocale.3
index 1d05ba7..1b31cf8 100644
--- a/man3/setlocale.3
+++ b/man3/setlocale.3
@@ -185,7 +185,7 @@ T}	Thread safety	MT-Unsafe const:locale env
 .TE
 
 .SH CONFORMING TO
-C89, C99, POSIX.1-2001.
+C89, C99, POSIX.1-2001, POSIX.1-2008.
 .SH SEE ALSO
 .BR locale (1),
 .BR localedef (1),

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
