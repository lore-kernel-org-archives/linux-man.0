From: Omar Sandoval <osandov@osandov.com>
Subject: [PATCH 2/2] mount.2: MS_BIND still ignores mountflags
Date: Thu, 12 May 2016 00:17:09 -0700
Message-ID: <f38bf1c7f30de297fc92efb9c6620f9c66599d09.1463037379.git.osandov@fb.com>
References: <8896f51c3802ade59b398058c1d22c9830f9ae09.1463037379.git.osandov@fb.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <8896f51c3802ade59b398058c1d22c9830f9ae09.1463037379.git.osandov@fb.com>
In-Reply-To: <8896f51c3802ade59b398058c1d22c9830f9ae09.1463037379.git.osandov@fb.com>
References: <8896f51c3802ade59b398058c1d22c9830f9ae09.1463037379.git.osandov@fb.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org, Omar Sandoval <osandov@fb.com>
List-Id: linux-man@vger.kernel.org

From: Omar Sandoval <osandov@fb.com>

This is clear from the do_mount() function in the kernel as of v4.6-rc7.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 man2/mount.2 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/man2/mount.2 b/man2/mount.2
index cc624d3fe1c6..162bbddeba21 100644
--- a/man2/mount.2
+++ b/man2/mount.2
@@ -98,10 +98,10 @@ The
 and
 .IR data
 arguments are ignored.
-Up until Linux 2.6.26,
+The
 .I mountflags
-was also ignored
-.\" with the exception of the "hidden" MS_REC mountflags bit
+argument is also ignored, with the exception of
+.B MS_REC
 (the bind mount has the same mount options as
 the underlying mount point).
 .TP
-- 
2.8.2

