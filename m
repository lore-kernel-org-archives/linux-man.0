From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] getutent.3: ATTRIBUTES: Note functions that aren't thread-safe
Date: Wed, 8 Apr 2015 10:56:17 +0800
Message-ID: <1428461788-7518-7-git-send-email-zenglg.jy@cn.fujitsu.com>
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

getutent:  MT-Unsafe init race:utent race:utentbuf sig:ALRM timer

getutid:   MT-Unsafe init race:utent sig:ALRM timer
getutline: MT-Unsafe init race:utent sig:ALRM timer

pututline: MT-Unsafe race:utent sig:ALRM timer

setutent:  MT-Unsafe race:utent
endutent:  MT-Unsafe race:utent
utmpname:  MT-Unsafe race:utent

Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/getutent.3 | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/man3/getutent.3 b/man3/getutent.3
index 4ff5581..1611d9b 100644
--- a/man3/getutent.3
+++ b/man3/getutent.3
@@ -155,6 +155,61 @@ functions can also fail for the reasons described in
 /var/run/utmp	database of currently logged-in users
 .br
 /var/log/wtmp	database of past user logins
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lb lb lbw28
+l l l.
+Interface	Attribute	Value
+T{
+.BR getutent ()
+T}	Thread safety	T{
+MT-Unsafe init race:utent
+.br
+race:utentbuf sig:ALRM timer
+T}
+T{
+.BR getutid (),
+.br
+.BR getutline ()
+T}	Thread safety	T{
+MT-Unsafe init race:utent
+.br
+sig:ALRM timer
+T}
+T{
+.BR pututline ()
+T}	Thread safety	T{
+MT-Unsafe race:utent
+.br
+sig:ALRM timer
+T}
+T{
+.BR setutent (),
+.br
+.BR endutent (),
+.br
+.BR utmpname ()
+T}	Thread safety	MT-Unsafe race:utent
+.TE
+
+In the above table,
+.I utent
+in
+.I race:utent
+signifies that if any of the functions
+.BR setutent (3),
+.BR getutent (3),
+.BR getutid (3),
+.BR getutline (3),
+.BR pututline (3),
+.BR utmpname (3),
+or
+.BR endutent (3)
+are used in parallel in different threads of a program,
+then data races could occur.
 .SH CONFORMING TO
 XPG2, SVr4.
 .LP
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
