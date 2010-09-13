From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for boot.7
Date: Mon, 13 Sep 2010 21:02:51 +0400
Message-ID: <20100913210251.620e7a76@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/id1.bo84Na/_UHaeT.sQOhu"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/id1.bo84Na/_UHaeT.sQOhu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

--- man-pages-git/man7/boot.7   2010-03-26 17:46:41.000000000 +0300
+++ /tmp/boot.7 2010-09-13 21:01:17.000000000 +0400
@@ -127,8 +127,8 @@
 Note:
 The following description applies to System V release 4 based system, which
 currently covers most commercial Unix systems (Solaris, HP-UX, Irix, Tru64)
-as well as the major Linux distributions (RedHat, Debian, Mandrake,
-Suse, Caldera).
+as well as the major Linux distributions (RedHat, Debian, Mandriva,
+Suse, Ubuntu).
 Some systems (Slackware Linux, FreeBSD, OpenBSD)
 have a somewhat different scheme of boot scripts.
 .LP


-- 
Best Regards,
Yuri Kozlov


--MP_/id1.bo84Na/_UHaeT.sQOhu
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=boot.7.patch

--- man-pages-git/man7/boot.7	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/boot.7	2010-09-13 21:01:17.000000000 +0400
@@ -127,8 +127,8 @@
 Note:
 The following description applies to System V release 4 based system, which
 currently covers most commercial Unix systems (Solaris, HP-UX, Irix, Tru64)
-as well as the major Linux distributions (RedHat, Debian, Mandrake,
-Suse, Caldera).
+as well as the major Linux distributions (RedHat, Debian, Mandriva,
+Suse, Ubuntu).
 Some systems (Slackware Linux, FreeBSD, OpenBSD)
 have a somewhat different scheme of boot scripts.
 .LP

--MP_/id1.bo84Na/_UHaeT.sQOhu--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
