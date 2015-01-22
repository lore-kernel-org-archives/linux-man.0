From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] proc.5: tfix
Date: Thu, 22 Jan 2015 20:21:03 +0100
Message-ID: <1421954463-2853-3-git-send-email-eliedebrauwer@gmail.com>
References: <1421954463-2853-1-git-send-email-eliedebrauwer@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421954463-2853-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/proc.5 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 5bff2a0..9138ead 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -1981,12 +1981,12 @@ Node 0, zone  Normal   216   55  189  101   84   38   37   27    5    3  587
 
 In this example, there is one node containing three zones and there
 are 11 different chunk sizes.
-If the page size is 4 kilobyteis, then the first zone called
+If the page size is 4 kilobytes, then the first zone called
 .I DMA
 (on x86 the first 16 megabyte of memory) has 1 chunk of 4 kilobytes
 (order 0) available and has 3 chunks of 4 megabytes (order 10) available.
 
-If the memory is heavily fragmentated, the counters for higher
+If the memory is heavily fragmented, the counters for higher
 order chunks will be zero and allocation of large contiguous areas
 will fail.
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
