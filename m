From: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] sigset.3: ATTRIBUTES: Note macros that are thread-safe
Date: Wed, 6 Aug 2014 16:06:10 +0800
Message-ID: <1407312370-12909-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The functions sigset(), sighold(), sigrelse() and sigignore()
are thread safe.

Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
---
 man3/sigset.3 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/man3/sigset.3 b/man3/sigset.3
index 5ff17a9..850469a 100644
--- a/man3/sigset.3
+++ b/man3/sigset.3
@@ -170,6 +170,22 @@ For
 .BR sigignore (),
 see the errors under
 .BR sigaction (2).
+.SH ATTRIBUTES
+For an explanation of the terms used in this section, see
+.BR attributes (7).
+.TS
+allbox;
+lbw23 lb lb
+l l l.
+Interface	Attribute	Value
+T{
+.BR sigset (),
+.BR sighold (),
+.br
+.BR sigrelse (),
+.BR sigignore ()
+T}	Thread safety	MT-Safe
+.TE
 .SH CONFORMING TO
 SVr4, POSIX.1-2001.
 These functions are obsolete: do not use them in new programs.
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
