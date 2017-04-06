From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Mention sudoers in nsswitch.conf(5)
Date: Thu, 6 Apr 2017 15:10:12 +0200
Message-ID: <885caec0-dded-e22f-8b55-08f2868ad059@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------4994291C20958AE7035E0F03"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------4994291C20958AE7035E0F03
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

It turns out that sudo drops things into nsswitch.conf, too.  It has 
been suggested that we should mention this in the manual page.

Thanks,
Florian

--------------4994291C20958AE7035E0F03
Content-Type: text/x-patch;
 name="sudoers.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="sudoers.patch"

diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
index 1e0ec3c..7a5b744 100644
--- a/man5/nsswitch.conf.5
+++ b/man5/nsswitch.conf.5
@@ -28,7 +28,7 @@ nsswitch.conf \- Name Service Switch configuration file
 .SH DESCRIPTION
 The Name Service Switch (NSS) configuration file,
 .IR /etc/nsswitch.conf ,
-is used by the GNU C Library to determine
+is used by the GNU C Library and certain other applications to determine
 the sources from which to obtain name-service information in
 a range of categories,
 and in what order.
@@ -102,6 +102,14 @@ Shadow user passwords, used by
 .BR getspnam (3)
 and related functions.
 .LP
+The GNU C Library ignores databases with unknown names.  Some
+applications use this to implement special handling for their own
+databases.  For example,
+.BR sudo (8)
+consults the
+.B sudoers
+database.
+.LP
 Here is an example
 .I /etc/nsswitch.conf
 file:

--------------4994291C20958AE7035E0F03--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
