From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: pid_namespaces.7: remove duplicated 'that'
Date: Fri, 16 Jan 2015 02:23:40 +0900
Message-ID: <CALhU9t=GoW1XsZ9TfO5RaCpe2ges_xYuo8oBogChAMUMwaJ53A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

diff --git a/man7/pid_namespaces.7 b/man7/pid_namespaces.7
index e6aaa60..c465950 100644
--- a/man7/pid_namespaces.7
+++ b/man7/pid_namespaces.7
@@ -222,7 +222,7 @@ can't be combined with some other
 flags:
 .IP * 3
 .B CLONE_THREAD
-requires being in the same PID namespace in order that that
+requires being in the same PID namespace in order that
 the threads in a process can send signals to each other.
 Similarly, it must be possible to see all of the threads
 of a processes in the


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
