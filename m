From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1] random.4: mention PRNG used by urandom
Date: Wed, 26 Nov 2014 23:58:29 +0100
Message-ID: <1417042709-16767-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

/dev/urandom uses a pseudo random number generator to replace
missing entropy.

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man4/random.4 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/man4/random.4 b/man4/random.4
index 44d9e34..1be19b8 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -63,8 +63,9 @@ will be set to
 .LP
 A read from the \fI/dev/urandom\fP device will not block
 waiting for more entropy.
-As a result, if there is not sufficient entropy in the
-entropy pool, the returned values are theoretically vulnerable to a
+If there is not sufficient entropy, a pseudorandom number generator is used
+to create the requested bytes.
+As a result, in this case the returned values are theoretically vulnerable to a
 cryptographic attack on the algorithms used by the driver.
 Knowledge of how to do this is not available in the current unclassified
 literature, but it is theoretically possible that such an attack may
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
