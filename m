From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for initrd.4
Date: Sun, 25 Jul 2010 14:54:32 +0400
Message-ID: <20100725145432.6b0c9ff0@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/TlZJRu1yUuo8I0r.uJuSE1J"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/TlZJRu1yUuo8I0r.uJuSE1J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.
--- man-pages-git/man4/initrd.4 2010-03-26 17:46:41.000000000 +0300
+++ /tmp/initrd.4       2010-07-25 14:53:29.000000000 +0400
@@ -246,7 +246,7 @@
 For more information on setting the root file system see also the
 .BR LILO
 and
-LOADLIN
+.BR LOADLIN
 documentation.
 .PP
 It is also possible for the


-- 
Best Regards,
Yuri Kozlov


--MP_/TlZJRu1yUuo8I0r.uJuSE1J
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=initrd.4.patch

--- man-pages-git/man4/initrd.4	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/initrd.4	2010-07-25 14:53:29.000000000 +0400
@@ -246,7 +246,7 @@
 For more information on setting the root file system see also the
 .BR LILO
 and
-LOADLIN
+.BR LOADLIN
 documentation.
 .PP
 It is also possible for the

--MP_/TlZJRu1yUuo8I0r.uJuSE1J--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
