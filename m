From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] mkstemp.3: added missing character
Date: Wed, 31 Aug 2011 23:54:52 +0900
Message-ID: <4E5E4B3C.1070007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why: ':' character was missed.


diff --git a/man3/mkstemp.3 b/man3/mkstemp.3
--- a/man3/mkstemp.3
+++ b/man3/mkstemp.3
@@ -156,7 +156,7 @@ now \fItemplate\fP is unchanged.
For
.BR mkstemps ()
and
-.BR mkostemps ()
+.BR mkostemps ():
.I template
is less than
.I "(6 + suffixlen)"

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
