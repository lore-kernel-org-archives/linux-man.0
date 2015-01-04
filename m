From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: shmget.2: typo fix
Date: Mon, 5 Jan 2015 06:36:11 +0900
Message-ID: <CALhU9tm2fRebgJz=a6u3ow277aHNsqP-eF3jtV1FtLXtkRBtpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man2/shmget.2 b/man2/shmget.2
index 01a44a8..213a451 100644
--- a/man2/shmget.2
+++ b/man2/shmget.2
@@ -209,7 +209,7 @@ but a shared memory segment already exists for
 A new segment was to be created and
 .I size
 is less than
-.B SHMIN
+.B SHMMIN
 or greater than
 .BR SHMMAX .
 .TP

-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
