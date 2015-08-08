From: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] mktemp.3: reference mkdtemp(3) in addition to mkstemp(3)
Date: Sat, 8 Aug 2015 10:05:17 +0200
Message-ID: <20150808080512.GA7386@glebfm.cloud.tilaa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mention mkdtemp(3) as another secure alternative to mktemp(3).

See also https://sourceware.org/bugzilla/show_bug.cgi?id=2898
---
 man3/mktemp.3 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/man3/mktemp.3 b/man3/mktemp.3
index 79e9023..0531fad 100644
--- a/man3/mktemp.3
+++ b/man3/mktemp.3
@@ -126,8 +126,10 @@ opening the file, every use of
 .BR mktemp ()
 is a security risk.
 The race is avoided by
-.BR mkstemp (3).
+.BR mkstemp (3) and
+.BR mkdtemp (3).
 .SH SEE ALSO
+.BR mkdtemp (3),
 .BR mkstemp (3),
 .BR tempnam (3),
 .BR tmpfile (3),
-- 
glebfm
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
