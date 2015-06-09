From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] strfmon.3: fix CONFORMING TO
Date: Tue, 09 Jun 2015 17:18:29 +0300
Message-ID: <5576F5B5.4060407@redhat.com>
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

AFAICS strfmon(3) is now defined in POSIX and the glibc
implementation is as specified there.

http://pubs.opengroup.org/onlinepubs/9699919799/functions/strfmon.html
---
 man3/strfmon.3 |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/man3/strfmon.3 b/man3/strfmon.3
index 3c1c19b..4964b36 100644
--- a/man3/strfmon.3
+++ b/man3/strfmon.3
@@ -149,8 +149,7 @@ T}	Thread safety	MT-Safe locale
 .TE
 
 .SH CONFORMING TO
-Not in POSIX.1-2001.
-Present on several other systems.
+POSIX.1-2008.
 .SH EXAMPLE
 The call
 .in +4n

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
