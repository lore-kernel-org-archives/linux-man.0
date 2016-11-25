From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH draft_keys 3/7] keyrings.7: spacing fix
Date: Fri, 25 Nov 2016 04:01:04 +0300
Message-ID: <20161125010104.GA453@obsidian>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51643019-bb42-4066-c824-c55b9e668ac6-ASgREoAs3yw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

---
 man7/keyrings.7 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man7/keyrings.7 b/man7/keyrings.7
index ed3bbee..c15a273 100644
--- a/man7/keyrings.7
+++ b/man7/keyrings.7
@@ -145,7 +145,7 @@ that should not be readable from user space.
 .\" commit ab3c3587f8cda9083209a61dbe3a4407d3cada10
 This key type is similar to the
 .I """user"""
-key type, but it may hold a payload of up to 1MiB in size.
+key type, but it may hold a payload of up to 1 MiB in size.
 The data may be stored in the swap space rather than in kernel memory
 if the data size exceeds the overhead of storing the data in swap space
 (a tmpfs file is used, which requires filesystem structures
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
