From: Douglas Caetano dos Santos <douglascs-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>
Subject: [PATCH] if_nameindex.3: tfix
Date: Tue, 9 May 2017 11:33:43 -0300
Message-ID: <102b6c5f-5fc8-f314-eb59-e701915b6266@taghos.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Douglas Caetano dos Santos <douglascs-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>
---
 man3/if_nameindex.3 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/man3/if_nameindex.3 b/man3/if_nameindex.3
index a22acb53c..d138c2847 100644
--- a/man3/if_nameindex.3
+++ b/man3/if_nameindex.3
@@ -55,12 +55,12 @@ The
 .I if_index
 field contains the interface index.
 The
-.I ifa_name
+.I if_name
 field points to the null-terminated interface name.
 The end of the array is indicated by entry with
 .I if_index
 set to zero and
-.I ifa_name
+.I if_name
 set to NULL.
 .PP
 The data structure returned by
-- 
2.12.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
