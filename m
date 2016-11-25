From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH draft_keys 4/7] keyrings.7: minor clarification regarding
 decision whether to store big_key in tmpfs or not
Date: Fri, 25 Nov 2016 04:01:11 +0300
Message-ID: <20161125010111.GA557@obsidian>
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
 man7/keyrings.7 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man7/keyrings.7 b/man7/keyrings.7
index c15a273..2f452c6 100644
--- a/man7/keyrings.7
+++ b/man7/keyrings.7
@@ -149,7 +149,8 @@ key type, but it may hold a payload of up to 1 MiB in size.
 The data may be stored in the swap space rather than in kernel memory
 if the data size exceeds the overhead of storing the data in swap space
 (a tmpfs file is used, which requires filesystem structures
-to be allocated in the kernel).
+to be allocated in the kernel; the size of these determines size threshold
+above which tmpfs storage method is used).
 This key type is useful for tasks such as holding Kerberos ticket caches.
 .PP
 There are more specialized key types available also,
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
