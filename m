From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/4] quotactl.2: wfix
Date: Wed, 21 Sep 2016 06:29:16 +0300
Message-ID: <20160921032916.GA5825@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man2/quotactl.2 |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/quotactl.2 b/man2/quotactl.2
index ea076f9..50ce29e 100644
--- a/man2/quotactl.2
+++ b/man2/quotactl.2
@@ -43,9 +43,9 @@ For each user and/or group,
 a soft limit and a hard limit can be set for each filesystem.
 The hard limit can't be exceeded.
 The soft limit can be exceeded, but warnings will ensue.
-Moreover, the user can't exceed the soft limit for more than one week
-(by default) at a time;
-after this time, the soft limit counts as a hard limit.
+Moreover, the user can't exceed the soft limit for more than grace period
+duration (one week by default) at a time;
+after this, the soft limit counts as a hard limit.
 
 The
 .BR quotactl ()
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
