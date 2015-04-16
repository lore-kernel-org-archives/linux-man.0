From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] setnetgrent.3: ATTRIBUTES: Note functions that aren't thread-safe
Date: Thu, 16 Apr 2015 13:09:36 +0800
Message-ID: <1429160978-15236-5-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1429160978-15236-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429160978-15236-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

setnetgrent:   MT-Unsafe race:netgrent locale
getnetgrent_r: MT-Unsafe race:netgrent locale
innetgr:       MT-Unsafe race:netgrent locale

endnetgrent:   MT-Unsafe race:netgrent

getnetgrent:   MT-Unsafe race:netgrent race:netgrentbuf locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/setnetgrent.3 | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/man3/setnetgrent.3 b/man3/setnetgrent.3
index 24675c8..233bea6 100644
--- a/man3/setnetgrent.3
+++ b/man3/setnetgrent.3
@@ -89,6 +89,50 @@ These functions return 1 on success and 0 for failure.
 .I /etc/netgroup
 .br
 .I /etc/nsswitch.conf
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw16 lb lbw23
+l l l.
+Interface	Attribute	Value
+T{
+.BR setnetgrent (),
+.br
+.BR getnetgrent_r (),
+.br
+.BR innetgr ()
+T}	Thread safety	T{
+MT-Unsafe race:netgrent
+.br
+locale
+T}
+T{
+.BR endnetgrent ()
+T}	Thread safety	MT-Unsafe race:netgrent
+T{
+.BR getnetgrent ()
+T}	Thread safety	T{
+MT-Unsafe race:netgrent
+.br
+race:netgrentbuf locale
+T}
+.TE
+
+In the above table,
+.I netgrent
+in
+.I race:netgrent
+signifies that if any of the functions
+.BR setnetgrent (3),
+.BR getnetgrent_r (3),
+.BR innetgr (3),
+.BR getnetgrent (3),
+or
+.BR endnetgrent (3)
+are used in parallel in different threads of a program,
+then data races could occur.
 .SH CONFORMING TO
 These functions are not in POSIX.1-2001, but
 .BR setnetgrent (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
