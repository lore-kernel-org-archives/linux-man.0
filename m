From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] capabilities.7: tfix
Date: Sat, 16 Mar 2013 23:58:05 +0100
Message-ID: <1363474685-21413-1-git-send-email-spaillard@debian.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

---
 man7/capabilities.7 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index 19a7309..637a99c 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -491,7 +491,7 @@ create memory mappings at addresses below the value specified by
 .IR /proc/sys/vm/mmap_min_addr ;
 .IP *
 map files in
-.IR /proc/pci/bus ;
+.IR /proc/bus/pci ;
 .IP *
 open
 .IR /dev/mem
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
