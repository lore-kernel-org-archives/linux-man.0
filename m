From: Tobias Stoeckmann <tobias-te0W2B6tFQkGQOE+iOL5gA@public.gmane.org>
Subject: [patch] setsid.2: tfix
Date: Tue, 18 Aug 2015 16:41:10 +0200
Message-ID: <20150818144110.GA1805@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

it -> its
---
 man2/setsid.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/setsid.2 b/man2/setsid.2
index 22885dd..089bf26 100644
--- a/man2/setsid.2
+++ b/man2/setsid.2
@@ -46,7 +46,7 @@ The calling process is the leader of the new session
 (i.e., its session ID is made the same as its process ID).
 The calling process also becomes
 the process group leader of a new process group in the session
-(i.e., its process group ID is made the same as it process ID).
+(i.e., its process group ID is made the same as its process ID).
 
 The calling process will be the only process in
 the new process group and in the new session.
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
