From: Nikolay Borisov <nborisov-IBi9RG/b67k@public.gmane.org>
Subject: [PATCH] bpf.2: Sync list of supported maps with 4.14 kernel
Date: Sun, 24 Dec 2017 00:02:17 +0200
Message-ID: <1514066537-17229-1-git-send-email-nborisov@suse.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nikolay Borisov <nborisov-IBi9RG/b67k@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Nikolay Borisov <nborisov-IBi9RG/b67k@public.gmane.org>
---
 man2/bpf.2 | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/man2/bpf.2 b/man2/bpf.2
index d306a1c18758..3beb1f0d92b2 100644
--- a/man2/bpf.2
+++ b/man2/bpf.2
@@ -353,6 +353,19 @@ enum bpf_map_type {
     BPF_MAP_TYPE_HASH,
     BPF_MAP_TYPE_ARRAY,
     BPF_MAP_TYPE_PROG_ARRAY,
+    BPF_MAP_TYPE_PERF_EVENT_ARRAY,
+    BPF_MAP_TYPE_PERCPU_HASH,
+    BPF_MAP_TYPE_PERCPU_ARRAY,
+    BPF_MAP_TYPE_STACK_TRACE,
+    BPF_MAP_TYPE_CGROUP_ARRAY,
+    BPF_MAP_TYPE_LRU_HASH,
+    BPF_MAP_TYPE_LRU_PERCPU_HASH,
+    BPF_MAP_TYPE_LPM_TRIE,
+    BPF_MAP_TYPE_ARRAY_OF_MAPS,
+    BPF_MAP_TYPE_HASH_OF_MAPS,
+    BPF_MAP_TYPE_DEVMAP,
+    BPF_MAP_TYPE_SOCKMAP,
+    BPF_MAP_TYPE_CPUMAP,
 };
 .EE
 .in
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
