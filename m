From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/15] proc.5: update reference to kernel's crypto API
 documentation
Date: Mon, 11 Sep 2017 05:04:11 +0200
Message-ID: <20170911030411.GA30162@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

DocBook documentation has been removed in commit v4.13-rc1~34^2~21^2~11.
Crypto API has been converted to ReStructured format during the Linux
4.10 development cycle (see commits v4.10-rc1~40^2~8 and
v4.10-rc1~40^2~7).

* man5/proc.5 (.SS Files and directories) <.TP .I /proc/crypto>: Amend
the reference to the kernel's crypto API documentation with the new
location, effective since Linux 4.10.

Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 man5/proc.5 | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/man5/proc.5 b/man5/proc.5
index 82f6ec4..9c62ee2 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2757,10 +2757,14 @@ A list of the ciphers provided by the kernel crypto API.
 For details, see the kernel
 .I "Linux Kernel Crypto API"
 documentation available under the kernel source directory
-.IR Documentation/DocBook .
-(That documentation can be built using a command such as
+.I Documentation/crypto/
+.\" commit 3b72c814a8e8cd638e1ba0da4dfce501e9dff5af
+(or
+.I Documentation/DocBook
+before 4.10;
+the documentation can be built using a command such as
 .IR "make htmldocs"
-in the root directory of the kernel source tree.)
+in the root directory of the kernel source tree).
 .TP
 .I /proc/cpuinfo
 This is a collection of CPU and system architecture dependent items,
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
