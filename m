From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mallinfo.3: ATTRIBUTES: Note function that is not thread-safe
Date: Mon, 24 Aug 2015 18:19:54 +0800
Message-ID: <1440411596-2566-5-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1440411596-2566-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440411596-2566-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
The marking of functions in glibc is:
- mallinfo: MT-Unsafe init const:mallopt

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mallinfo.3 | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/man3/mallinfo.3 b/man3/mallinfo.3
index 7797169..e6661d1 100644
--- a/man3/mallinfo.3
+++ b/man3/mallinfo.3
@@ -107,6 +107,31 @@ This is the maximum number of bytes that could ideally
 .BR malloc_trim (3).
 .\" .SH VERSIONS
 .\" Available already in glibc 2.0, possibly earlier
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw28
+l l l.
+Interface	Attribute	Value
+T{
+.BR mallinfo ()
+T}	Thread safety	MT-Unsafe init const:mallopt
+.TE
+
+.BR mallinfo ()
+would access some global iternal objects. If modify them with non-atomically,
+may get inconsistent results.
+The identifier
+.I mallopt
+in
+.I const:mallopt
+mean that
+.BR mallopt ()
+would modify the global iternal objects with atomics, that make sure
+.BR mallinfo ()
+is safe enough, others modify with non-atomically maybe not.
 .SH CONFORMING TO
 This function is not specified by POSIX or the C standards.
 A similar function exists on many System V derivatives,
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
