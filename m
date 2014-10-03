From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 3/3] random.4: SEE ALSO getrandom.2
Date: Fri,  3 Oct 2014 02:15:35 +0200
Message-ID: <1412295335-8287-1-git-send-email-xypron.glpk@gmx.de>
References: <1412295197-8100-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412295197-8100-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 man4/random.4 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/man4/random.4 b/man4/random.4
index a193ddf..9ec0341 100644
--- a/man4/random.4
+++ b/man4/random.4
@@ -280,6 +280,7 @@ wall clock) to the pools.
 .\" The kernel's random number generator was written by
 .\" Theodore Ts'o (tytso-f/2Lh7Kzk888qNwGfFDJ/Q@public.gmane.org).
 .SH SEE ALSO
+.BR getrandom (2),
 .BR mknod (1)
 .br
 RFC\ 1750, "Randomness Recommendations for Security"
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
