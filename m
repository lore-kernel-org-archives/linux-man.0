From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] nscd.conf.5: add note about default values
Date: Wed, 05 Feb 2014 10:43:26 +0100
Message-ID: <52F207BE.5090805@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040503080305010502010101"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------040503080305010502010101
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

this patch adds note to the nscd.conf(5) man page about default values,
stating that default values originate from nscd(8) source code and that
default values used in the nscd.conf(5) file in distribution might
differ.

Thanks,

peter

--------------040503080305010502010101
Content-Type: text/x-patch;
 name="nscd.conf.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="nscd.conf.patch"

diff --git a/man5/nscd.conf.5 b/man5/nscd.conf.5
index 3e8cf45..2d66cd0 100644
--- a/man5/nscd.conf.5
+++ b/man5/nscd.conf.5
@@ -229,6 +229,12 @@ This option is valid only for services
 and
 .IR group .
 .RE
+.SH NOTES
+The default values stated in this manual page originate from the source code of
+.BR nscd (8)
+and are used if not set in configuration file.
+The default values used in the configuration file of your distribution might
+differ.
 .SH SEE ALSO
 .BR nscd (8)
 .\" .SH AUTHOR

--------------040503080305010502010101--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
