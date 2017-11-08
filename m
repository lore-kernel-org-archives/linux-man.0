From: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] timerfd_create.2: wfix
Date: Wed, 8 Nov 2017 16:23:49 +0900
Message-ID: <35ea4d16-3a86-0ce2-9cd3-3f83fae9cf88@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-GB
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

There's no itimer structure.

---
 man2/timerfd_create.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/timerfd_create.2 b/man2/timerfd_create.2
index 31ee21f31..b550c7cb9 100644
--- a/man2/timerfd_create.2
+++ b/man2/timerfd_create.2
@@ -148,7 +148,7 @@ The
 .I new_value
 argument specifies the initial expiration and interval for the timer.
 The
-.I itimer
+.I itimerspec
 structure used for this argument contains two fields,
 each of which is in turn a structure of type
 .IR timespec :
-- 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
