From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small fix for umount.2
Date: Sat, 17 Jul 2010 13:05:34 +0400
Message-ID: <20100717130534.2b2a8049@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/2/GvLPblFIrLlABETUCYlav"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/2/GvLPblFIrLlABETUCYlav
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.
-- man-pages-git/man2/umount.2 2010-07-17 09:02:09.000000000 +0400
+++ /tmp/umount.2       2010-07-17 13:04:34.000000000 +0400
@@ -93,7 +93,7 @@
 Don't dereference
 .I target
 if it is a symbolic link.
-This flag allows security problems to be avoided in in set-user-ID-\fIroot\fP
+This flag allows security problems to be avoided in set-user-ID-\fIroot\fP
 programs that allow unprivileged users to unmount file systems.
 .SH "RETURN VALUE"
 On success, zero is returned.

-- 
Best Regards,
Yuri Kozlov


--MP_/2/GvLPblFIrLlABETUCYlav
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=umount.2.patch

--- man-pages-git/man2/umount.2	2010-07-17 09:02:09.000000000 +0400
+++ /tmp/umount.2	2010-07-17 13:04:34.000000000 +0400
@@ -93,7 +93,7 @@
 Don't dereference
 .I target
 if it is a symbolic link.
-This flag allows security problems to be avoided in in set-user-ID-\fIroot\fP
+This flag allows security problems to be avoided in set-user-ID-\fIroot\fP
 programs that allow unprivileged users to unmount file systems.
 .SH "RETURN VALUE"
 On success, zero is returned.

--MP_/2/GvLPblFIrLlABETUCYlav--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
