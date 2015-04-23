From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] mcheck.3: ATTRIBUTES: Note functions that aren't thread-safe
Date: Thu, 23 Apr 2015 12:51:45 +0800
Message-ID: <1429764710-8598-5-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

mcheck() and mprobe() match glibc markings.
>From research, We think mcheck_pedantic() and mcheck_check_all() are not
thread-safe. But, there is not markings of mcheck_pedantic() and
mcheck_check_all() in glibc document.
- mcheck:           MT-Unsafe race:mcheck const:malloc_hooks
- mcheck_pedantic:  MT-Unsafe race:mcheck const:malloc_hooks
- mcheck_check_all: MT-Unsafe race:mcheck const:malloc_hooks
- mprobe:           MT-Unsafe race:mcheck const:malloc_hooks

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/mcheck.3 | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/man3/mcheck.3 b/man3/mcheck.3
index e59da31..b836de7 100644
--- a/man3/mcheck.3
+++ b/man3/mcheck.3
@@ -142,6 +142,27 @@ The
 and
 .BR mprobe ()
 functions are present since at least glibc 2.0
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw28 lb lbw21
+l l l.
+Interface	Attribute	Value
+T{
+.BR mcheck (),
+.BR mcheck_pedantic (),
+.br
+.BR mcheck_check_all (),
+.BR mprobe ()
+T}	Thread safety	T{
+MT-Unsafe race:mcheck
+.br
+const:malloc_hooks
+T}
+.TE
+
 .SH CONFORMING TO
 These functions are GNU extensions.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
