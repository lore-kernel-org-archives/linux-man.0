From: Ivana Hutarova Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: prctl.2: PR_SET_SECCOMP - _exit behavior
Date: Thu, 18 Nov 2010 15:51:38 +0100
Message-ID: <4CE53D7A.6040502@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090701040502040706060905"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------090701040502040706060905
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

prctl.2 man page (man-pages-3.30) wrote:
  PR_SET_SECCOMP ... After the secure computing mode has been set to 1, 
the only system calls that the thread is permitted to make are read(2), 
write(2),  _exit(2), and sigreturn(2),
but _exit(2) wrapper from 2.3 does not call _exit() sysscall but invokes 
exit_group(2) syscall(see exit.2). This may lead to misunderstanding. 
prctl.2 man page may contain some note about this fact too.
The patch which adds this note to prctl is attached
Ivana HUtarova Varekova

--------------090701040502040706060905
Content-Type: text/x-patch;
 name="man-pages-3.30-prctl.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="man-pages-3.30-prctl.patch"

diff -up man-pages-3.30/man2/prctl.2.pom man-pages-3.30/man2/prctl.2
--- man-pages-3.30/man2/prctl.2.pom	2010-11-01 15:55:38.000000000 +0100
+++ man-pages-3.30/man2/prctl.2	2010-11-18 14:42:50.000000000 +0100
@@ -236,9 +236,15 @@ After the secure computing mode has been
 the only system calls that the thread is permitted to make are
 .BR read (2),
 .BR write (2),
-.BR _exit (2),
+.BR sigreturn (2)
 and
-.BR sigreturn (2).
+.BR _exit (2).
+In glibc up to version 2.3, the
+.BR _exit()
+wrapper function invoked the kernel system call of the same name.
+Since glibc 2.3, the  wrapper  function
+invokes
+.BR exit_group(2).
 Other system calls result in the delivery of a
 .BR SIGKILL
 signal.

--------------090701040502040706060905--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
