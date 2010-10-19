From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for mbind.2 (more)
Date: Tue, 19 Oct 2010 10:40:22 +0400
Message-ID: <20101019104022.062a4205@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/A9phIeyk1T+0Qc3/kgtEG_w"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/A9phIeyk1T+0Qc3/kgtEG_w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

--- man-pages-git/man2/mbind.2  2010-03-26 17:46:41.000000000 +0300
+++ /tmp/mbind.2        2010-10-19 10:38:48.000000000 +0400
@@ -48,11 +48,12 @@
 
 If the memory range specified by the
 .IR addr " and " len
-arguments includes an "anonymous" region of memory\(emthat is
+arguments includes an "anonymous" region of memory \(em that is
 a region of memory created using the
 .BR mmap (2)
 system call with the
-.BR MAP_ANONYMOUS \(emor
+.BR MAP_ANONYMOUS 
+\(em or
 a memory mapped file, mapped using the
 .BR mmap (2)
 system call with the
@@ -247,7 +248,7 @@
 is passed in
 .I flags
 and
-.I policy
+.I mode
 is not
 .BR MPOL_DEFAULT ,


-- 
Best Regards,
Yuri Kozlov


--MP_/A9phIeyk1T+0Qc3/kgtEG_w
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=mbind.2.patch

--- man-pages-git/man2/mbind.2	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/mbind.2	2010-10-19 10:38:48.000000000 +0400
@@ -48,11 +48,12 @@
 
 If the memory range specified by the
 .IR addr " and " len
-arguments includes an "anonymous" region of memory\(emthat is
+arguments includes an "anonymous" region of memory \(em that is
 a region of memory created using the
 .BR mmap (2)
 system call with the
-.BR MAP_ANONYMOUS \(emor
+.BR MAP_ANONYMOUS 
+\(em or
 a memory mapped file, mapped using the
 .BR mmap (2)
 system call with the
@@ -247,7 +248,7 @@
 is passed in
 .I flags
 and
-.I policy
+.I mode
 is not
 .BR MPOL_DEFAULT ,
 then the call will fail with the error

--MP_/A9phIeyk1T+0Qc3/kgtEG_w--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
