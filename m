From: Peter Wu <peter@lekensteyn.nl>
Subject: [PATCH] bpf.2: update enum bpf_map_type and enum bpf_prog_type
Date: Sun,  4 Aug 2019 21:53:53 +0100
Message-ID: <20190804205353.2956-1-peter@lekensteyn.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Taken from Linux v5.3-rc2. Add a reference to the header file to save
the future reader some time figuring out whether more entries exist.

Signed-off-by: Peter Wu <peter@lekensteyn.nl>
---
 man2/bpf.2 | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/man2/bpf.2 b/man2/bpf.2
index 5a766aaa8..51e3bd111 100644
--- a/man2/bpf.2
+++ b/man2/bpf.2
@@ -367,6 +367,14 @@ enum bpf_map_type {
     BPF_MAP_TYPE_DEVMAP,
     BPF_MAP_TYPE_SOCKMAP,
     BPF_MAP_TYPE_CPUMAP,
+    BPF_MAP_TYPE_XSKMAP,
+    BPF_MAP_TYPE_SOCKHASH,
+    BPF_MAP_TYPE_CGROUP_STORAGE,
+    BPF_MAP_TYPE_REUSEPORT_SOCKARRAY,
+    BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE,
+    BPF_MAP_TYPE_QUEUE,
+    BPF_MAP_TYPE_STACK,
+    /* See /usr/include/linux/bpf.h for the full list. */
 };
 .EE
 .in
@@ -756,6 +764,25 @@ enum bpf_prog_type {
     BPF_PROG_TYPE_KPROBE,
     BPF_PROG_TYPE_SCHED_CLS,
     BPF_PROG_TYPE_SCHED_ACT,
+    BPF_PROG_TYPE_TRACEPOINT,
+    BPF_PROG_TYPE_XDP,
+    BPF_PROG_TYPE_PERF_EVENT,
+    BPF_PROG_TYPE_CGROUP_SKB,
+    BPF_PROG_TYPE_CGROUP_SOCK,
+    BPF_PROG_TYPE_LWT_IN,
+    BPF_PROG_TYPE_LWT_OUT,
+    BPF_PROG_TYPE_LWT_XMIT,
+    BPF_PROG_TYPE_SOCK_OPS,
+    BPF_PROG_TYPE_SK_SKB,
+    BPF_PROG_TYPE_CGROUP_DEVICE,
+    BPF_PROG_TYPE_SK_MSG,
+    BPF_PROG_TYPE_RAW_TRACEPOINT,
+    BPF_PROG_TYPE_CGROUP_SOCK_ADDR,
+    BPF_PROG_TYPE_LWT_SEG6LOCAL,
+    BPF_PROG_TYPE_LIRC_MODE2,
+    BPF_PROG_TYPE_SK_REUSEPORT,
+    BPF_PROG_TYPE_FLOW_DISSECTOR,
+    /* See /usr/include/linux/bpf.h for the full list. */
 };
 .EE
 .in
-- 
2.22.0
