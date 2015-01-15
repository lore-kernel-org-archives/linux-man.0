From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: user_namespaces.7: tfix
Date: Fri, 16 Jan 2015 02:26:55 +0900
Message-ID: <CALhU9t=9sJhNpEUGyr_2Tsvv_DTE-g4KsPSPkqqShruCR-T0KQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

diff --git a/man7/user_namespaces.7 b/man7/user_namespaces.7
index ce4955b..30c5a7d 100644
--- a/man7/user_namespaces.7
+++ b/man7/user_namespaces.7
@@ -292,7 +292,7 @@ flags
 and the "atime" flags
 .RB ( MS_NOATIME ,
 .BR MS_NODIRATIME ,
-.BR MS_RELATIME)
+.BR MS_REALTIME)
 settings become locked
 .\" commit 9566d6742852c527bf5af38af5cbb878dad75705
 .\" Author: Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
