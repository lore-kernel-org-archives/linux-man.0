From: John Marshall <jm18-5fLPn3lgkryFxr2TtlUqVg@public.gmane.org>
Subject: [patch] open.2: wfix
Date: Tue, 06 May 2014 13:17:01 +0100
Message-ID: <E1WheIv-0006U7-Ih@gen1a.internal.sanger.ac.uk>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: John Marshall <jm18-5fLPn3lgkryFxr2TtlUqVg@public.gmane.org>
---
 man2/open.2 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/open.2 b/man2/open.2
index a9ff304..4a1344c 100644
--- a/man2/open.2
+++ b/man2/open.2
@@ -748,7 +748,7 @@ except for the differences described here.
 If the pathname given in
 .I pathname
 is relative, then it is interpreted relative to the directory
-relative to by the file descriptor
+referred to by the file descriptor
 .I dirfd
 (rather than relative to the current working directory of
 the calling process, as is done by
-- 
1.7.9.5



-- 
 The Wellcome Trust Sanger Institute is operated by Genome Research 
 Limited, a charity registered in England with number 1021457 and a 
 company registered in England with number 2742969, whose registered 
 office is 215 Euston Road, London, NW1 2BE. 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
