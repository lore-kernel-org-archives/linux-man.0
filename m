From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] sigprocmask.2: do not specify an exact value of rt_sigprocmask's 4th argument
Date: Mon, 20 Feb 2017 00:13:03 +0300
Message-ID: <20170219211302.GA30235@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

As sizeof(kernel_sigset_t) is not the same for all architectures,
it would be better not to mention any numbers as its value.

Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
---
 man2/sigprocmask.2 | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/man2/sigprocmask.2 b/man2/sigprocmask.2
index 8388340..6379a4d 100644
--- a/man2/sigprocmask.2
+++ b/man2/sigprocmask.2
@@ -202,10 +202,11 @@ which specifies the size in bytes of the signal sets in
 .IR set
 and
 .IR oldset .
-This argument is currently required to have the value 8
-(
-.IR sizeof(kernel_sigset_t)
-).
+This argument is currently required to have a fixed value
+(equal to
+.IR sizeof(kernel_sigset_t) ).
+.\" sizeof(kernel_sigset_t) == _NSIG / 8,
+.\" which equals to 8 on most architectures, but e.g. on MIPS it's 16.
 
 The glibc
 .BR sigprocmask ()
-- 
ldv

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
