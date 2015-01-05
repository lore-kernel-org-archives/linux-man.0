From: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: readlink.2: remove dup word
Date: Tue, 6 Jan 2015 03:01:28 +0900
Message-ID: <CALhU9t=ZJPbW6_i4o5qt+P=xE4-KywcyBxmPX=UJC=wANJVM9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

diff --git a/man2/readlink.2 b/man2/readlink.2
index 41523b8..720fa99 100644
--- a/man2/readlink.2
+++ b/man2/readlink.2
@@ -138,7 +138,7 @@ Since Linux 2.6.39,
 can be an empty string,
 in which case the call operates on the symbolic link referred to by
 .IR dirfd
-(which should have have been obtained using
+(which should have been obtained using
 .BR open (2)
 with the
 .B O_PATH


-- 
Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
