From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getnetent.3: ATTRIBUTES: Note functions that aren't thread-safe
Date: Wed, 8 Apr 2015 10:56:15 +0800
Message-ID: <1428461788-7518-5-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1428461788-7518-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428461788-7518-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The markings match glibc markings.

getnetent:    MT-Unsafe race:netent race:netentbuf env locale

getnetbyname: MT-Unsafe race:netbyname env locale

getnetbyaddr: MT-Unsafe race:netbyaddr locale

setnetent:    MT-Unsafe race:netent env locale
endnetent:    MT-Unsafe race:netent env locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getnetent.3 | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/man3/getnetent.3 b/man3/getnetent.3
index f071744..c4f197e 100644
--- a/man3/getnetent.3
+++ b/man3/getnetent.3
@@ -142,6 +142,57 @@ error occurs or the end of the file is reached.
 .TP
 .I /etc/networks
 networks database file
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw14 lb lbw25
+l l l.
+Interface	Attribute	Value
+T{
+.BR getnetent ()
+T}	Thread safety	T{
+MT-Unsafe race:netent
+.br
+race:netentbuf env locale
+T}
+T{
+.BR getnetbyname ()
+T}	Thread safety	T{
+MT-Unsafe race:netbyname
+.br
+env locale
+T}
+T{
+.BR getnetbyaddr ()
+T}	Thread safety	T{
+MT-Unsafe race:netbyaddr
+.br
+locale
+T}
+T{
+.BR setnetent (),
+.br
+.BR endnetent ()
+T}	Thread safety	T{
+MT-Unsafe race:netent env
+.br
+locale
+T}
+.TE
+
+In the above table,
+.I netent
+in
+.I race:netent
+signifies that if any of the functions
+.BR setnetent (3),
+.BR getnetent (3),
+or
+.BR endnetent (3)
+are used in parallel in different threads of a program,
+then data races could occur.
 .SH CONFORMING TO
 4.3BSD, POSIX.1-2001.
 .SH NOTES
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
