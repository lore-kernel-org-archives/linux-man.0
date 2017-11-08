From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] aio.7: wsfix
Date: Wed, 8 Nov 2017 16:04:37 +0900
Message-ID: <61343fc2-d0b5-3786-e8ca-04420a5beebf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

 man7/aio.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/aio.7 b/man7/aio.7
index 248c98ec3..df26117e3 100644
--- a/man7/aio.7
+++ b/man7/aio.7
@@ -389,7 +389,7 @@ main(int argc, char *argv[])
                     if (s == AIO_CANCELED)
                         printf("I/O canceled\\n");
                     else if (s == AIO_NOTCANCELED)
-                            printf("I/O not canceled\\n");
+                        printf("I/O not canceled\\n");
                     else if (s == AIO_ALLDONE)
                         printf("I/O all done\\n");
                     else
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
