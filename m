From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: rename.2: remove unnecessary period
Date: Fri, 16 Jan 2015 02:22:14 +0900
Message-ID: <CALhU9tm7-Ni8btnL6ZZOjhLYKkfAvn2eMVhZ1fnt8eMfp=vvvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

diff --git a/man2/rename.2 b/man2/rename.2
index bd37428..d30cf8b 100644
--- a/man2/rename.2
+++ b/man2/rename.2
@@ -186,7 +186,7 @@ argument is a bit mask consisting of zero or more
of the following flags:
 .TP
 .B RENAME_NOREPLACE
 Don't overwrite
-.IR newpath .
+.I newpath
 of the rename.
 Return an error if
 .IR newpath


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
