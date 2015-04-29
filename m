From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] qsort.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 29 Apr 2015 18:09:25 +0800
Message-ID: <1430302166-1700-9-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1430302166-1700-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430302166-1700-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

qsort() matches glibc marking.
>From research, We think qsort_r() is thread-safe. But, there
is not marking of qsort_r() in glibc document.
- qsort:   MT-Safe
- qsort_r: MT-Safe

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/qsort.3 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/man3/qsort.3 b/man3/qsort.3
index 442ae15..286263a 100644
--- a/man3/qsort.3
+++ b/man3/qsort.3
@@ -97,6 +97,20 @@ functions return no value.
 .SH VERSIONS
 .BR qsort_r ()
 was added to glibc in version 2.8.
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw18 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR qsort (),
+.BR qsort_r ()
+T}	Thread safety	MT-Safe
+.TE
+
 .SH CONFORMING TO
 The
 .BR qsort ()
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
