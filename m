From: Sebastian Krohn <seb-MqitPnHoYOBn68oJJulU0Q@public.gmane.org>
Subject: [PATCH] flock(2) does work with NFS/NLM
Date: Wed, 17 Mar 2010 10:58:37 +0100
Message-ID: <20100317095835.GD87508@knorr.darksystem.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


While debugging an NFS setup I've noticed flock(2) says the following:

> flock() does not lock files over NFS. Use fcntl(2) instead: that does
> work over NFS, given a sufficiently recent version of Linux and a
> server which supports locking.

This is not true. I used flock(1) which uses flock(2) as per it's
manpage and strace and the locks worked fine:

> NLM[host,0]: 0:0 1 GRANTED (0x0000000062720038) \
>    fsid=0x00c8c721 fileid=0x004108d1

Thus, I believe this paragraph should be deleted.

Regards,

   Sebastian


diff --git a/man2/flock.2 b/man2/flock.2
index f009ea3..d604318 100644
--- a/man2/flock.2
+++ b/man2/flock.2
@@ -143,13 +143,6 @@ possibly implemented in terms of
 .BR fcntl (2),
 appears on most Unix systems.
 .SH NOTES
-.BR flock ()
-does not lock files over NFS.
-Use
-.BR fcntl (2)
-instead: that does work over NFS, given a sufficiently recent version of
-Linux and a server which supports locking.
-.PP
 Since kernel 2.0,
 .BR flock ()
 is implemented as a system call in its own right rather
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
