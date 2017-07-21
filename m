From: Douglas Caetano dos Santos <douglascs-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>
Subject: [PATCH] bpf.2: ffix
Date: Fri, 21 Jul 2017 10:55:19 -0300
Message-ID: <dffbb176-7a87-4c08-bbc8-cfcf3f9f68d4@taghos.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

'\' must be escaped.

Signed-off-by: Douglas Caetano dos Santos <douglascs-6ANAkuZINJhwFqzsTH5u/w@public.gmane.org>
---
 man2/bpf.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man2/bpf.2 b/man2/bpf.2
index d4fca8245..2360c11b6 100644
--- a/man2/bpf.2
+++ b/man2/bpf.2
@@ -986,7 +986,7 @@ main(int argc, char **argv)
         assert(bpf_lookup_elem(map_fd, &key, &tcp_cnt) == 0);
         key = IPPROTO_UDP;
         assert(bpf_lookup_elem(map_fd, &key, &udp_cnt) == 0);
-        printf("TCP %lld UDP %lld packets\n", tcp_cnt, udp_cnt);
+        printf("TCP %lld UDP %lld packets\\n", tcp_cnt, udp_cnt);
         sleep(1);
     }
 
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
