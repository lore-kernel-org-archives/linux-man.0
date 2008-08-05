From: "Maxin John" <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] mprotect.2: removal of EFAULT from mprotect man page
Date: Tue, 5 Aug 2008 10:51:25 +0530
Message-ID: <9debc4410808042221u2dcd955ap62db32c7034608f8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dear Michael,

              As per the discussion in linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, I
am sending the patch for removal of EFAULT from mprotect.2 man page to
the linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org mailing list.

Signed-off-by: Maxin B. John <maxin.john-qujY0cBTTHtBDgjK7y7TUQ@public.gmane.org>


diff -Naur man-pages-3.05/man2/mprotect.2
man-pages-3.05_modified/man2/mprotect.2
--- man-pages-3.05/man2/mprotect.2      2008-07-23 19:42:13.000000000 +0530
+++ man-pages-3.05_modified/man2/mprotect.2     2008-08-04
15:34:33.400869088 +0530
@@ -87,9 +87,6 @@
 to mark it
 .BR PROT_WRITE .
 .TP
-.B EFAULT
-The memory cannot be accessed.
-.TP
 .B EINVAL
 \fIaddr\fP is not a valid pointer,
 or not a multiple of the system page size.



Thanks and Regards,

Maxin B. John
Bangalore, India
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
