From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getprotoent.3: ATTRIBUTES: Note functions that aren't thread-safe
Date: Wed, 3 Jun 2015 18:16:28 +0800
Message-ID: <1433326594-25001-4-git-send-email-zenglg.jy@cn.fujitsu.com>
References: <1433326594-25001-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433326594-25001-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The marking matches glibc marking.
markings of functions in glibc are:
- getprotoent:      MT-Unsafe race:protoent race:protoentbuf locale

- getprotobyname:   MT-Unsafe race:protobyname locale

- getprotobynumber: MT-Unsafe race:protobynumber locale

- setprotoent:      MT-Unsafe race:protoent locale
- endprotoent:      MT-Unsafe race:protoent locale

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getprotoent.3 | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/man3/getprotoent.3 b/man3/getprotoent.3
index d41e926..56fac15 100644
--- a/man3/getprotoent.3
+++ b/man3/getprotoent.3
@@ -137,6 +137,57 @@ error occurs or the end of the file is reached.
 .I /etc/protocols
 protocol database file
 .PD
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw18 lb lbw28
+l l l.
+Interface	Attribute	Value
+T{
+.BR getprotoent ()
+T}	Thread safety	T{
+MT-Unsafe race:protoent
+.br
+race:protoentbuf locale
+T}
+T{
+.BR getprotobyname ()
+T}	Thread safety	T{
+MT-Unsafe race:protobyname
+.br
+locale
+T}
+T{
+.BR getprotobynumber ()
+T}	Thread safety	T{
+MT-Unsafe race:protobynumber
+.br
+locale
+T}
+T{
+.BR setprotoent (),
+.br
+.BR endprotoent ()
+T}	Thread safety	T{
+MT-Unsafe race:protoent
+.br
+locale
+T}
+.TE
+
+In the above table,
+.I protoent
+in
+.I race:protoent
+signifies that if any of the functions
+.BR setprotoent (3),
+.BR getprotoent (3),
+or
+.BR endprotoent (3)
+are used in parallel in different threads of a program,
+then data races could occur.
 .SH CONFORMING TO
 4.3BSD, POSIX.1-2001.
 .SH SEE ALSO
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
