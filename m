From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] atexit.3: wfix
Date: Wed, 8 Nov 2017 16:06:00 +0900
Message-ID: <cb3296c2-bba3-0197-fb1a-e8eeed7d3921@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

 man3/atexit.3 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man3/atexit.3 b/man3/atexit.3
index b52e71bb8..edf6f74c6 100644
--- a/man3/atexit.3
+++ b/man3/atexit.3
@@ -133,7 +133,7 @@ of their registration by these two functions.
 .PP
 According to POSIX.1, the result is undefined if
 .BR longjmp (3)
-is used to terminate execution of one of the functions registered
+is used to terminate execution of one of the functions registered using
 .BR atexit ().
 .\" In glibc, things seem to be handled okay
 .SS Linux notes
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
