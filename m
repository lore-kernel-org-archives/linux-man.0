From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] hsearch.3: update ERRORS section
Date: Wed, 31 Aug 2011 23:46:00 +0900
Message-ID: <4E5E4928.7030301@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

man-pages version: latest git repository
why:
Remove ENOMEM and ESRCH from the list for hcreate() and hcreate_h().
The (e)glibc implementation of the two functions (of course!) doesn't
set such errors. The two error codes are garbage from commit fe80e23e.

Then, hdestroy_r() was added to the list.


diff --git a/man3/hsearch.3 b/man3/hsearch.3
--- a/man3/hsearch.3
+++ b/man3/hsearch.3
@@ -191,22 +191,16 @@ returns nonzero on success, and 0 on error.
.SH ERRORS
.LP
.BR hcreate ()
-and
+,
.BR hcreate_r ()
+and
+.BR hdestroy_r ()
can fail for the following reasons:
.TP
.B EINVAL
.RB ( hcreate_r ())
.I htab
is NULL.
-.TP
-.B ENOMEM
-Table full with \fIaction\fP set to \fBENTER\fP.
-.TP
-.B ESRCH
-The \fIaction\fP argument is \fBFIND\fP and no corresponding element
-is found in the table.
-.\" hdestroy_r() can set errno to EINVAL if 'tab' is NULL.
.PP
.BR hsearch ()
and

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
