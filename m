From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for random.4
Date: Tue, 27 Jul 2010 12:59:59 +0400
Message-ID: <20100727125959.50e76c23@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/UYXH.VcgXkikK1D0av7Us9E"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/UYXH.VcgXkikK1D0av7Us9E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

--- man-pages-git/man4/random.4 2010-03-26 17:46:41.000000000 +0300
+++ /tmp/random.4       2010-07-27 12:59:14.000000000 +0400
@@ -59,7 +59,7 @@
 .IR /dev/urandom
 should be used for everything except long-lived GPG/SSL/SSH keys.
 
-If a seed file is saved across reboots as recommended above (all major
+If a seed file is saved across reboots as recommended below (all major
 Linux distributions have done this since 2000 at least), the output is
 cryptographically secure against attackers without local root access as
 soon as it is reloaded in the boot sequence, and perfectly adequate for


-- 
Best Regards,
Yuri Kozlov


--MP_/UYXH.VcgXkikK1D0av7Us9E
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=random.4.diff

--- man-pages-git/man4/random.4	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/random.4	2010-07-27 12:59:14.000000000 +0400
@@ -59,7 +59,7 @@
 .IR /dev/urandom
 should be used for everything except long-lived GPG/SSL/SSH keys.
 
-If a seed file is saved across reboots as recommended above (all major
+If a seed file is saved across reboots as recommended below (all major
 Linux distributions have done this since 2000 at least), the output is
 cryptographically secure against attackers without local root access as
 soon as it is reloaded in the boot sequence, and perfectly adequate for

--MP_/UYXH.VcgXkikK1D0av7Us9E--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
