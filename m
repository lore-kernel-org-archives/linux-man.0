From: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Subject: [PATCH v2] sendfile.2: Document more return values
Date: Fri, 11 Dec 2015 21:10:04 +0100
Message-ID: <1449864604-32189-1-git-send-email-laurent.georget@supelec.fr>
References: <1449820983-17810-1-git-send-email-laurent.georget@supelec.fr>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449820983-17810-1-git-send-email-laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

As of version 4.3, sendfile(2) can return more error codes than are
documented in sendfile.2. This patch adds some details:

    - EINVAL can be returned if count is negative, from function rw_verify_area
      in fs/read_write.c, called from do_sendfile, called from sys_sendfile.
    - EOVERFLOW can be returned if count is too large, from rw_verify_area,
      called from do_sendfile, called from sys_sendfile, or directly from
      do_sendfile in one case (pos + count > max size of either in_fd or
      out_fd).
    - ESPIPE can be returned if offset is not a NULL pointer but the input file
      does not support FMODE_PREAD, from do_sendfile, called from sys_sendfile.

Signed-off-by: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
---

I removed EPERM from the patch because actually, it cannot be returned in a
vanilla kernel. I had it in my case because of SELinux. There is a call to the
LSM hook security_file_permission inside the function rw_verify_area.

Cheers,

Laurent

 man2/sendfile.2 | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/man2/sendfile.2 b/man2/sendfile.2
index 93cf7e1..b56365e 100644
--- a/man2/sendfile.2
+++ b/man2/sendfile.2
@@ -136,7 +136,10 @@ Bad address.
 Descriptor is not valid or locked, or an
 .BR mmap (2)-like
 operation is not available for
-.IR in_fd .
+.IR in_fd ,
+or
+.I count
+is negative.
 .TP
 .B EINVAL
 .I out_fd
@@ -153,6 +156,16 @@ Unspecified error while reading from
 .B ENOMEM
 Insufficient memory to read from
 .IR in_fd .
+.TP
+.B EOVERFLOW
+.I count
+is too large, the operation would result in exceeding the maximum size of either
+the input file or the output file.
+.TP
+.B ESPIPE
+.I offset
+is not NULL but the input file is not
+.BR seek (2)-able.
 .SH VERSIONS
 .BR sendfile ()
 first appeared in Linux 2.2.
-- 
2.4.10

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
