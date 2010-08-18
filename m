From: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Subject: small improvement for fork.2
Date: Wed, 18 Aug 2010 21:31:03 +0400
Message-ID: <20100818213103.41245b8b@keeper.home.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/Q10PEtD=G80Sr1f9itydBao"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/Q10PEtD=G80Sr1f9itydBao
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.
--- man-pages-git/man2/fork.2   2010-03-26 17:46:41.000000000 +0300
+++ /tmp/fork.2 2010-08-18 21:29:45.000000000 +0400
@@ -84,8 +84,8 @@
 from its parent
 .RB ( aio_read (3),
 .BR aio_write (3)),
-nor does it inherit any asynchronous I/O contexts from its parent
-.RB ( see io_setup (2)).
+nor does it inherit any asynchronous I/O contexts from its parent (see
+.BR io_setup (2)).
 .PP
 The process attributes in the preceding list are all specified
 in POSIX.1-2001.

-- 
Best Regards,
Yuri Kozlov


--MP_/Q10PEtD=G80Sr1f9itydBao
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=fork.2.patch

--- man-pages-git/man2/fork.2	2010-03-26 17:46:41.000000000 +0300
+++ /tmp/fork.2	2010-08-18 21:29:45.000000000 +0400
@@ -84,8 +84,8 @@
 from its parent
 .RB ( aio_read (3),
 .BR aio_write (3)),
-nor does it inherit any asynchronous I/O contexts from its parent
-.RB ( see io_setup (2)).
+nor does it inherit any asynchronous I/O contexts from its parent (see
+.BR io_setup (2)).
 .PP
 The process attributes in the preceding list are all specified
 in POSIX.1-2001.

--MP_/Q10PEtD=G80Sr1f9itydBao--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
