From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nroff syntax error in man2/kexec_load.2
Date: Tue, 2 Nov 2010 00:13:45 +0100
Message-ID: <AANLkTikqy1T+DSM9DTkj6D61i1vEBvDFZN+a53f56A0o@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

Here is a trivial patch to fix nroff syntax.
Michael, there is something wrong on your git repository, master
points to 09fa72f instead of d84f58c.


diff --git a/man2/kexec_load.2 b/man2/kexec_load.2
index e0dff72..dc250c4 100644
--- a/man2/kexec_load.2
+++ b/man2/kexec_load.2
@@ -25,7 +25,7 @@
 .SH NAME
 kexec_load \- load a new kernel for later execution
 .SH SYNOPSIS
-.b #include <linux/kexec.h>
+.B #include <linux/kexec.h>
 .br
 .BI "long kexec_load(unsigned long " entry ", unsigned long " nr_segments ","
 .br
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
