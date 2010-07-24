From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for fd.4
Date: Sat, 24 Jul 2010 08:26:40 +0400
Message-ID: <20100724082640.17bf7e97@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/UJIEcI8Kt6eTEujMxZsaACQ"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/UJIEcI8Kt6eTEujMxZsaACQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.
--- man-pages-git/man4/fd.4     2010-03-26 17:46:41.000000000 +0300
+++ /tmp/fd.4   2010-07-24 08:25:43.000000000 +0400
@@ -187,7 +187,7 @@
 .PP
 For more precise information, consult also the \fI<linux/fd.h>\fP and
 \fI<linux/fdreg.h>\fP include files, as well as the manual page for
-floppycontrol.
+floppycontrol(1).
 .SH FILES
 /dev/fd*
 .SH NOTES

-- 
Best Regards,
Yuri Kozlov


--MP_/UJIEcI8Kt6eTEujMxZsaACQ
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=fd.4.patch

--- man-pages-git/man4/fd.4	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/fd.4	2010-07-24 08:25:43.000000000 +0400
@@ -187,7 +187,7 @@
 .PP
 For more precise information, consult also the \fI<linux/fd.h>\fP and
 \fI<linux/fdreg.h>\fP include files, as well as the manual page for
-floppycontrol.
+floppycontrol(1).
 .SH FILES
 /dev/fd*
 .SH NOTES

--MP_/UJIEcI8Kt6eTEujMxZsaACQ--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
