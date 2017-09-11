From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/15] initrd.4: update pointer to in-kernel root over NFS
 documentation
Date: Mon, 11 Sep 2017 05:04:01 +0200
Message-ID: <20170911030401.GA29972@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Linux commit v2.6.33-rc1~57^2~37 moves all NFS-related documentation to
nfs sub-directory.

* man4/initrd.4 (.SS Changing the normal root filesystem): Amend pointer
to Documentation/nfsroot.txt with change introduced in Linux 2.6.33
(move to Documentation/nfs/nfsroot.txt)

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man4/initrd.4 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/man4/initrd.4 b/man4/initrd.4
index 57fa650..70ef9d3 100644
--- a/man4/initrd.4
+++ b/man4/initrd.4
@@ -243,7 +243,11 @@ and
 .B nfs_root_addrs
 boot options to give the NFS settings.
 For more information on NFS-mounted root see the kernel documentation file
-.BR Documentation/filesystems/nfsroot.txt .
+.I Documentation/filesystems/nfs/nfsroot.txt
+.\" commit dc7a08166f3a5f23e79e839a8a88849bd3397c32
+(or
+.I Documentation/filesystems/nfsroot.txt
+before Linux 2.6.33).
 For more information on setting the root filesystem see also the
 .BR LILO
 and
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
