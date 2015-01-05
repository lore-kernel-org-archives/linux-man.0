From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: setsid.2: format fix
Date: Tue, 6 Jan 2015 03:01:25 +0900
Message-ID: <CALhU9tnQhL4yZAr_Drpd3bEophdNfDs+MJsaK=kmkktQuxS9jQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man2/setsid.2 b/man2/setsid.2
index cff8e22..ee9abac 100644
--- a/man2/setsid.2
+++ b/man2/setsid.2
@@ -76,7 +76,7 @@ The session ID is preserved across an

 A process group leader is a process whose process group ID equals its PID.
 Disallowing a process group leader from calling
-.BR setsid()
+.BR setsid ()
 prevents the possibility that a process group leader places itself
 in a new session while other processes in the process group remain
 in the original session;


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
