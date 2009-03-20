From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [Patch] describe 'swappiness' for proc(5)
Date: Fri, 20 Mar 2009 11:46:47 +0800
Message-ID: <20090320034647.GC14567@hack>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org


Add descriptions for /proc/sys/vm/swappiness.

Signed-off-by: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

---
diff --git a/man5/proc.5 b/man5/proc.5
index 48c103a..c74d7f7 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -2382,6 +2382,14 @@ user should run
 .BR sync (8)
 first.
 .TP
+.IR /proc/sys/vm/swappiness
+.\" The following is from Documentation/sysctl/vm.txt
+This control is used to define how aggressive the kernel will swap
+memory pages.  Higher values will increase agressiveness, lower values
+descrease the amount of swap.
+
+The default value is 60.
+.TP
 .IR /proc/sys/vm/legacy_va_layout " (since Linux 2.6.9)"
 .\" The following is from Documentation/filesystems/proc.txt
 If non-zero, this disables the new 32-bit memory-mapping layout;

 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
