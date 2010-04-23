From: Mark Seaborn <mseaborn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] mprotect(2): mention effect of READ_IMPLIES_EXEC personality
	flag
Date: Fri, 23 Apr 2010 17:31:01 +0100
Message-ID: <w2ke1cf9ca11004230931yff731f6gb45134c3d0d51cbe@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I puzzled over mprotect()'s effect on /proc/*/maps for a while
yesterday -- it was setting "x" without PROT_EXEC being specified.
Here is a patch to add some explanation.

mprotect(2): mention effect of READ_IMPLIES_EXEC personality flag

diff --git a/man2/mprotect.2 b/man2/mprotect.2
index d7b9712..a5aa2fb 100644
--- a/man2/mprotect.2
+++ b/man2/mprotect.2
@@ -125,7 +125,15 @@ Whether
 .B PROT_EXEC
 has any effect different from
 .B PROT_READ
-is architecture- and kernel version-dependent.
+depends on processor architecture, kernel version, and process state. If
+.B READ_IMPLIES_EXEC
+is set in the process's personality flags (see
+.BR personality (2)),
+specifying
+.B PROT_READ
+will implicitly add
+.BR PROT_EXEC.
+
 On some hardware architectures (e.g., i386),
 .B PROT_WRITE
 implies
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
