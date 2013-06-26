From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
	<jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
Subject: [patch] timegm.3: copy the string returned by getenv()
Date: Wed, 26 Jun 2013 11:08:49 -0400
Message-ID: <1372259329-26397-1-git-send-email-jeremie.galarneau@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?J=C3=A9r=C3=A9mie=20Galarneau?= <jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The example of a portable version of timegm() uses the string returned =
by
getenv() after calling setenv() on the same environment variale. The tz
string may be invalid as per getenv.3:

"The string pointed to by the return value of getenv() may be staticall=
y
allocated, and can be modified by a subsequent call to getenv(), putenv=
(3),
setenv(3), or unsetenv(3)."

Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.=
com>
---
 man3/timegm.3 | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/man3/timegm.3 b/man3/timegm.3
index 3ab194b..0e71be5 100644
--- a/man3/timegm.3
+++ b/man3/timegm.3
@@ -84,12 +84,15 @@ my_timegm(struct tm *tm)
     char *tz;
=20
     tz =3D getenv("TZ");
+    if (tz)
+        tz =3D strdup(tz);
     setenv("TZ", "", 1);
     tzset();
     ret =3D mktime(tm);
-    if (tz)
+    if (tz) {
         setenv("TZ", tz, 1);
-    else
+        free(tz);
+    } else
         unsetenv("TZ");
     tzset();
     return ret;
--=20
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
