From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for pread.2
Date: Sat, 12 Jun 2010 10:15:20 +0400
Message-ID: <20100612101520.4edbb0de@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/AYWX1Y7w=R+.+fASsERmSfI"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/AYWX1Y7w=R+.+fASsERmSfI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

--- pread.2     2010-03-26 17:46:41.000000000 +0300
+++ /tmp/pread.2        2010-06-12 10:11:33.000000000 +0400
@@ -65,7 +65,7 @@
 .BR pwrite (),
 or
 end of file, in the case of
-.BR pread (),
+.BR pread ()),
 or \-1 on error, in which case
 .I errno
 is set to indicate the error.

-- 
Best Regards,
Yuri Kozlov


--MP_/AYWX1Y7w=R+.+fASsERmSfI
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=pread.2.diff

--- pread.2	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/pread.2	2010-06-12 10:11:33.000000000 +0400
@@ -65,7 +65,7 @@
 .BR pwrite (),
 or
 end of file, in the case of
-.BR pread (),
+.BR pread ()),
 or \-1 on error, in which case
 .I errno
 is set to indicate the error.

--MP_/AYWX1Y7w=R+.+fASsERmSfI--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
