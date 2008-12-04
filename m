From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: [PATCH] open_wmemstream(3): Describe (as part of fmemopen.3)
Date: Fri, 5 Dec 2008 00:23:28 +0100
Message-ID: <20081204232328.GJ10491@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>

diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
index 47187b6..add9d5f 100644
--- a/man3/fmemopen.3
+++ b/man3/fmemopen.3
@@ -2,9 +2,9 @@
 .\" and Copyright 2005 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 .\" Distributed under the GPL.
 .\"
-.TH FMEMOPEN 3 2008-10-12 "GNU" "Linux Programmer's Manual"
+.TH FMEMOPEN 3 2008-12-04 "GNU" "Linux Programmer's Manual"
 .SH NAME
-fmemopen, open_memstream \-  open memory as stream
+fmemopen, open_memstream, open_wmemstream \-  open memory as stream
 .SH SYNOPSIS
 .B #define _GNU_SOURCE
 .br
@@ -14,6 +14,10 @@ fmemopen, open_memstream \-  open memory as stream
 .BI "const char *" mode ");"
 .sp
 .BI "FILE *open_memstream(char **" ptr ", size_t *" sizeloc );
+.sp
+.B #include <wchar.h>
+.br
+.BI "FILE *open_wmemstream(wchar_t **" ptr ", size_t *" sizeloc );
 .SH DESCRIPTION
 The
 .BR fmemopen ()
@@ -138,11 +142,16 @@ or
 Moving the file position past the end
 of the data already written fills the intervening space with
 zeros.
+
+The
+.BR open_wmemstream ()
+is similar but operates on wide characters instead of bytes.
 .SH "RETURN VALUE"
 Upon successful completion
-.BR fmemopen ()
-and
+.BR fmemopen (),
 .BR open_memstream ()
+and
+.BR open_wmemstream ()
 return a
 .I FILE
 pointer.
diff --git a/man3/open_wmemstream.3 b/man3/open_wmemstream.3
new file mode 100644
index 0000000..afcad2f
--- /dev/null
+++ b/man3/open_wmemstream.3
@@ -0,0 +1 @@
+.so man3/fmemopen.3
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
