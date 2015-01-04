From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: semop.2: Add section number for external reference
Date: Mon, 5 Jan 2015 06:29:20 +0900
Message-ID: <CALhU9t=YPqso=VhvQpoGRn8_ZG9GvVfs4++X+7tLaztHerRP9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man2/semop.2 b/man2/semop.2
index 54078db..357132c 100644
--- a/man2/semop.2
+++ b/man2/semop.2
@@ -439,7 +439,7 @@ the corresponding
 .I semadj
 values in all processes are cleared.
 The
-.BR clone ()
+.BR clone (2)
 .B CLONE_SYSVSEM
 flag allows more than one process to share a
 .I semadj

-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
