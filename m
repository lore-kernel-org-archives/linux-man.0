From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: recv.2: fix variable name
Date: Mon, 5 Jan 2015 06:26:55 +0900
Message-ID: <CALhU9t=42DQgs34oj=VV8wPhhNFwRbnamDVfuDxS+iGDMR7z7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man2/recv.2 b/man2/recv.2
index e673a12..a3470cf 100644
--- a/man2/recv.2
+++ b/man2/recv.2
@@ -330,7 +330,7 @@ The caller should set
 .I msg_namelen
 to the size of this buffer before this call;
 upon return from a successful call,
-.I msg_name
+.I msg_namelen
 will contain the length of the returned address.
 If the application does not need to know the source address,
 .I msg_name


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
