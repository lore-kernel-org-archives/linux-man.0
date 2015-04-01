From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] gethostbyname.3: ATTRIBUTES: Note functions thoes aren't thread-safe
Date: Wed, 1 Apr 2015 18:13:56 +0800
Message-ID: <1427883237-21242-2-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1427883237-21242-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427883237-21242-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/gethostbyname.3 | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/man3/gethostbyname.3 b/man3/gethostbyname.3
index 41a5886..91898b9 100644
--- a/man3/gethostbyname.3
+++ b/man3/gethostbyname.3
@@ -314,6 +314,77 @@ host database file
 .TP
 .I /etc/nsswitch.conf
 name service switch configuration
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw18 lb lbw29
+l l l.
+Interface	Attribute	Value
+T{
+.BR gethostbyname ()
+T}	Thread safety	T{
+MT-Unsafe race:hostbyname env
+.br
+locale
+T}
+T{
+.BR gethostbyaddr ()
+T}	Thread safety	T{
+MT-Unsafe race:hostbyaddr env
+.br
+locale
+T}
+T{
+.BR sethostent (),
+.br
+.BR endhostent (),
+.br
+.BR gethostent_r ()
+T}	Thread safety	T{
+MT-Unsafe race:hostent env
+.br
+locale
+T}
+T{
+.BR herror (),
+.br
+.BR hstrerror ()
+T}	Thread safety	MT-Safe
+T{
+.BR gethostent ()
+T}	Thread safety	T{
+MT-Unsafe race:hostent
+.br
+race:hostentbuf env locale
+T}
+T{
+.BR gethostbyname2 ()
+T}	Thread safety	T{
+MT-Unsafe race:hostbyname2
+.br
+env locale
+T}
+T{
+.BR gethostbyaddr_r (),
+.BR gethostbyname_r (),
+.BR gethostbyname2_r ()
+T}	Thread safety	MT-Safe env locale
+.TE
+
+In the above table,
+.I hostent
+in
+.I race:hostent
+signifies that if any of the functions
+.BR sethostent (3),
+.BR gethostent (3),
+.BR gethostent_r (3),
+or
+.BR endhostent (3)
+are used in parallel in different threads of a program,
+then data races could occur.
 .SH CONFORMING TO
 POSIX.1-2001 specifies
 .BR gethostbyname (),
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
