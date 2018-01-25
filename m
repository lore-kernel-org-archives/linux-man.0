From: Carsten Grohmann <carstengrohmann-Mmb7MZpHnFY@public.gmane.org>
Subject: [patch] shutdown(2): Add backlink to close(2)
Date: Thu, 25 Jan 2018 14:38:42 +0100
Message-ID: <20180125143842.03800061@max.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/81h/_8nXdCLD7M.E3t+37C5"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--MP_/81h/_8nXdCLD7M.E3t+37C5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Michael,

The close(2) man page contains in the "SEE ALSO" section a reference to
shutdown(2). But shutdown(2) doesn't have the back reference.

I think the backlink is useful, because both calls can be used to close
sockets.

The attached patch adds the backlink.

Kind regards,
Carsten

--MP_/81h/_8nXdCLD7M.E3t+37C5
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=shutdown.2.diff

--- shutdown.2.orig	2018-01-23 21:37:50.000000000 +0100
+++ shutdown.2	2018-01-23 21:37:35.382169253 +0100
@@ -114,6 +114,7 @@
 .\" and for DECnet sockets in commit 46b66d7077b89fb4917ceef19b3f7dd86055c94a
 in Linux 3.7.
 .SH SEE ALSO
+.BR close (2),
 .BR connect (2),
 .BR socket (2),
 .BR socket (7)

--MP_/81h/_8nXdCLD7M.E3t+37C5--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
