From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for kexec_load.2
Date: Sat, 6 Nov 2010 11:38:09 +0300
Message-ID: <20101106113809.49422a9b@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_//u0W8tke6/30j5bD9vA55om"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_//u0W8tke6/30j5bD9vA55om
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

--- man-pages-git/man2/kexec_load.2     2010-11-02 13:41:53.000000000 +0300
+++ /tmp/kexec_load.2   2010-11-06 11:36:45.000000000 +0300
@@ -121,8 +121,9 @@
 .TP
 .B EINVAL
 .I flags
-is invalid; of
-.IR nr_segments is too large
+is invalid; or
+.IR nr_segments
+is too large.
 .\" KEXEC_SEGMENT_MAX == 16
 .TP
 .B EPERM

-- 
Best Regards,
Yuri Kozlov


--MP_//u0W8tke6/30j5bD9vA55om
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=kexec_load.2.patch

--- man-pages-git/man2/kexec_load.2	2010-11-02 13:41:53.000000000 +0300
+++ /tmp/kexec_load.2	2010-11-06 11:36:45.000000000 +0300
@@ -121,8 +121,9 @@
 .TP
 .B EINVAL
 .I flags
-is invalid; of
-.IR nr_segments is too large
+is invalid; or
+.IR nr_segments
+is too large.
 .\" KEXEC_SEGMENT_MAX == 16
 .TP
 .B EPERM

--MP_//u0W8tke6/30j5bD9vA55om--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
