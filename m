From: krzysztof.kulakowski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Subject: [PATCH] mbind.2: Update MPOL_BIND section
Date: Fri, 10 Mar 2017 07:31:58 -0500
Message-ID: <1489149118-171304-1-git-send-email-krzysztof.kulakowski@intel.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kulakowski <krzysztof.kulakowski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

From: Krzysztof Kulakowski <krzysztof.kulakowski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Behavior of MPOL_BIND has been changed in kernel commit
19770b32609b6bf97a3dece2529089494cbfc549. This patch updates section
describing MPOL_BIND to be in sync with current state of
Documentation/vm/numa_memory_policy.txt.

Signed-off-by: Krzysztof Kulakowski <krzysztof.kulakowski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 man2/mbind.2 | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/man2/mbind.2 b/man2/mbind.2
index f34e9ae..c0f078b 100644
--- a/man2/mbind.2
+++ b/man2/mbind.2
@@ -215,14 +215,8 @@ the nodes specified in
 If
 .I nodemask
 specifies more than one node, page allocations will come from
-the node with the lowest numeric node ID first, until that node
-contains no free memory.
-Allocations will then come from the node with the next highest
-node ID specified in
-.I nodemask
-and so forth, until none of the specified nodes contain free memory.
-Pages will not be allocated from any node not specified in the
-.IR nodemask .
+the node with sufficient free memory that is closest to
+the node where the allocation takes place.
 .TP
 .B MPOL_INTERLEAVE
 This mode specifies that page allocations be interleaved across the
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
