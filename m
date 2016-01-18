From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: locale.1: update for 104511
Date: Mon, 18 Jan 2016 12:56:08 +0200
Message-ID: <569CC4C8.9070608@redhat.com>
Reply-To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Addresses https://bugzilla.kernel.org/show_bug.cgi?id=104511.

---
 man1/locale.1 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man1/locale.1 b/man1/locale.1
index c10355f..505191d 100644
--- a/man1/locale.1
+++ b/man1/locale.1
@@ -162,6 +162,10 @@ $ \fBlocale \-ck date_fmt\fP
 LC_TIME
 date_fmt="%a %b %e %H:%M:%S %Z %Y"
 
+$ \fBlocale -c charmap\fP
+LC_CTYPE
+UTF-8
+
 $ \fBlocale LC_TELEPHONE\fP
 +%c (%a) %l
 (%a) %l

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
