From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for kexec_load.2 and getutent.3
Date: Tue, 2 Nov 2010 15:10:43 +0300
Message-ID: <20101102151043.220797e6@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/_1Qv92.dgrrDy9zl6LikX_I"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/_1Qv92.dgrrDy9zl6LikX_I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

-- 
Best Regards,
Yuri Kozlov


--MP_/_1Qv92.dgrrDy9zl6LikX_I
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=getutent.3.patch

--- man-pages-git/man3/getutent.3	2010-11-02 13:41:53.000000000 +0300
+++ man-pages/man3/getutent.3	2010-11-02 15:08:42.000000000 +0300
@@ -209,7 +209,7 @@
 .sp
 .nf
 .BR "#define _GNU_SOURCE" "    /* or _SVID_SOURCE or _BSD_SOURCE;
-.R "\&                          see feature_test_macros(7) */
+.BR "\&                          see feature_test_macros(7) */
 .B #include <utmp.h>
 .sp
 .BI "int getutent_r(struct utmp *" ubuf ", struct utmp **" ubufp );

--MP_/_1Qv92.dgrrDy9zl6LikX_I
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=kexec_load.2.patch

--- man-pages-git/man2/kexec_load.2	2010-11-02 13:41:53.000000000 +0300
+++ man-pages/man2/kexec_load.2	2010-11-02 15:05:22.000000000 +0300
@@ -25,7 +25,7 @@
 .SH NAME
 kexec_load \- load a new kernel for later execution
 .SH SYNOPSIS
-.b #include <linux/kexec.h>
+.B #include <linux/kexec.h>
 .br
 .BI "long kexec_load(unsigned long " entry ", unsigned long " nr_segments ","
 .br

--MP_/_1Qv92.dgrrDy9zl6LikX_I--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
