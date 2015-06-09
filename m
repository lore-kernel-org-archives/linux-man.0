From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] setlocale.3: tweak C/POSIX locale portability description
Date: Tue, 09 Jun 2015 17:18:09 +0300
Message-ID: <5576F5A1.9030202@redhat.com>
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

as discussed earlier, the current description might be a little
bit too stringent, let's avoid the issue by describing the
portability aspect on a slightly higher level.

References:

http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap06.html
http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap07.html
http://pubs.opengroup.org/onlinepubs/9699919799/functions/setlocale.html
---
 man3/setlocale.3 |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/man3/setlocale.3 b/man3/setlocale.3
index a3102ba..1d05ba7 100644
--- a/man3/setlocale.3
+++ b/man3/setlocale.3
@@ -117,10 +117,8 @@ The locale
 .B """C"""
 or
 .B """POSIX"""
-is a portable locale; its
-.B LC_CTYPE
-part corresponds to the 7-bit ASCII
-character set.
+is a portable locale;
+it exists on all conforming systems.
 .PP
 A locale name is typically of the form
 .IR language "[_" territory "][." codeset "][@" modifier "],"

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
