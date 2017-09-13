From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [man-pages PATCH] hpsa.4: tfix
Date: Wed, 13 Sep 2017 13:58:40 +0200
Message-ID: <20170913115839.GA31488@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The last bit of off-by-one error left.

* man4/hpsa.4 (.SH DESCRIPTION): The changes are planed for Linux 4.14,
  not 4.13.

Fixes: 70d6fc4c288 ("cciss.4, hpsa.4: Mention cciss removal in Linux 4.13")
Reported-by: Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man4/hpsa.4 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man4/hpsa.4 b/man4/hpsa.4
index 9b7fd82..64f4536 100644
--- a/man4/hpsa.4
+++ b/man4/hpsa.4
@@ -54,7 +54,7 @@ driver supports the following Smart Array boards:
 .fi
 .PP
 .\" commit 135ae6edeb51979d0998daf1357f149a7d6ebb08
-Since Linux 4.13, the following Smart Array boards are also supported:
+Since Linux 4.14, the following Smart Array boards are also supported:
 .PP
 .nf
     Smart Array 5300
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
