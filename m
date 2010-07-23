From: Jon Jensen <jon-O9fzpki4YnJWk0Htik3J/w@public.gmane.org>
Subject: Subject: [PATCH] Correct description of
 /proc/sys/kernel/random/entropy_avail
Date: Thu, 22 Jul 2010 18:18:18 -0600 (MDT)
Message-ID: <alpine.DEB.2.00.1007221816280.641@nhtr.ovalna.fjrygre.arg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Patch against Git HEAD, based on others' comments on the web and empirical 
observation just reading the file repeatedly.

It contains the number of bits of currently available entropy,
not always the pool size of 4096.
---
  man4/random.4 |    4 ++--
  1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man4/random.4 b/man4/random.4
index 2307e07..b097b6d 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -177,9 +177,9 @@ and can be changed to any value for which an algorithm is available.
  The choices are 32, 64, 128, 256, 512, 1024, or 2048.
  .TP
  Linux 2.6:
-This file is read-only, and gives the size of the entropy pool in
+This file is read-only, and gives the amount of available entropy in
  .IR bits .
-It contains the value 4096.
+The value will range from 0 to 4096 in a standard kernel.
  .RE
  .LP
  The file
-- 
1.7.1.86.g0e460

-- 
Jon Jensen
End Point Corporation
http://www.endpoint.com/

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
