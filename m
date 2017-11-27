From: Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] mount.2: Add EINVAL error condition when MS_BINDing
 MNT_LOCKED submounts
Date: Mon, 27 Nov 2017 17:44:17 -0500
Message-ID: <20171127224417.GA5122@juliacomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

When the user creates an unpriviledged mount namespace, the linux
kernel sets the MNT_LOCKED flag [1] on any submounts to prevent
such mounts from being unmounted inside the mount namespace. Such
an unmount would reveal the filesystem tree behind the mount, which
is not otherwise possible from an unpriviledge vantage point.

Attempting to unmount such a mount will fail with EINVAL. However,
less obvious implication is that attempting a bind mount without
MS_REC, where the tree being bound contains locked sub-mounts,
will also fail with EINVAL, because, without MS_REC, such submounts
are effectively being unmounted.

Cursory googling shows several instances of people running into this
problem, so I felt it advantageous to have it documented in the man
page.

[1] https://github.com/torvalds/linux/blob/4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323/fs/namespace.c#L1110-L1113
---
 man2/mount.2 | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/man2/mount.2 b/man2/mount.2
index 87cb1a9..8d2a347 100644
--- a/man2/mount.2
+++ b/man2/mount.2
@@ -650,6 +650,14 @@ or
 .BR EINVAL
 An attempt was made to bind mount an unbindable mount.
 .TP
+.BR EINVAL
+In an unpriviledged mount namespace, a bind operation
+.RB ( MS_BIND )
+was attempted without specifying
+.RB ( MS_REC ),
+which would have revealed the filesytem tree underneath one of
+the submounts of the directory being bound.
+.TP
 .B ELOOP
 Too many links encountered during pathname resolution.
 .TP
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
