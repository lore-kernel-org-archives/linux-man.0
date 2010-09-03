From: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Subject: [PATCH] statfs.2: Fix copy & paste error for __SWORD_TYPE
 definition
Date: Fri, 3 Sep 2010 05:25:31 +0200
Message-ID: <20100903032531.GA16572@gaara.hadrons.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The statfs structs only make use of __SWORD_TYPE, so the __UWORD_TYPE
macro is wrong there.

Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
---
 man2/statfs.2 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/man2/statfs.2 b/man2/statfs.2
index ea2f085..e0e5988 100644
--- a/man2/statfs.2
+++ b/man2/statfs.2
@@ -46,7 +46,7 @@ structure defined approximately as follows:
 .in +4n
 .nf
 #if __WORDSIZE == 32		/* System word size */
-# define __UWORD_TYPE		unsigned int
+# define __SWORD_TYPE		int
 #else /* __WORDSIZE == 64 */
 # define __SWORD_TYPE		long int
 #endif
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
