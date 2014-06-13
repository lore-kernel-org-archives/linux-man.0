From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] recv.2: tfix
Date: Fri, 13 Jun 2014 21:21:37 +0900
Message-ID: <CALhU9tm5JFXVrXFqTw=PaNQ42PmUSa+v7WfNMR+RAX4DAOkg0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/recv.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/recv.2 b/man2/recv.2
index 6815fd7..3b82bbd 100644
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
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
