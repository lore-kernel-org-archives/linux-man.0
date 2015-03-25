From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH v2] scanf.3: ATTRIBUTES: Note functions those are thread-safe
Date: Wed, 25 Mar 2015 11:15:29 +0800
Message-ID: <1427253330-27357-5-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1427253330-27357-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427253330-27357-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/scanf.3 | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/man3/scanf.3 b/man3/scanf.3
index 02455b4..6018694 100644
--- a/man3/scanf.3
+++ b/man3/scanf.3
@@ -574,6 +574,26 @@ Out of memory.
 .B ERANGE
 The result of an integer conversion would exceed the size
 that can be stored in the corresponding integer type.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw20 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR scanf (),
+.BR fscanf (),
+.br
+.BR sscanf (),
+.BR vscanf (),
+.br
+.BR vsscanf (),
+.BR vfscanf ()
+T}	Thread safety	MT-Safe locale
+.TE
+
 .SH CONFORMING TO
 The functions
 .BR fscanf (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
