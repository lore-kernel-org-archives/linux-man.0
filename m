From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: shmget.2: format fix
Date: Mon, 5 Jan 2015 06:37:09 +0900
Message-ID: <CALhU9tmwe8YmqU7L1o+ioBsR2LNRkOwtd6sCjd4ygva7qd2G6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man2/shmget.2 b/man2/shmget.2
index 213a451..6d318d8 100644
--- a/man2/shmget.2
+++ b/man2/shmget.2
@@ -283,9 +283,7 @@ The following limits on shared memory segment
resources affect the
 call:
 .TP
 .B SHMALL
-System-wide limit on the number of
-.I pages
-of shared memory.
+System-wide limit on the number of pages of shared memory.

 On Linux, this limit can be read and modified via
 .IR /proc/sys/kernel/shmall .


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
