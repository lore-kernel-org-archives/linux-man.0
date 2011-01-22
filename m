From: Richard Kettlewell <rjk-2BcWPXkLGI+tmTQ+vhA3Yw@public.gmane.org>
Subject: [patch] proc.5: correct RLIMIT_RSS reference, also note that it is
 obsolete
Date: Sat, 22 Jan 2011 10:49:22 +0000
Message-ID: <4D3AB632.6050405@terraraq.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

The patch is against git head.  I obtained the information (that 
RLIMIT_RSS is obsolete) from 'man setrlimit' and verified it by 
inspecting kernel source.

ttfn/rjk

diff --git a/man5/proc.5 b/man5/proc.5
index 7c5ca4e..f7ab1e8 100644
--- a/man5/proc.5
+++ b/man5/proc.5
@@ -761,7 +761,9 @@ Current soft limit in bytes on the rss of the process;
  see the description of
  .B RLIMIT_RSS
  in
-.BR getpriority (2).
+.BR getrlimit (2).
+.IP
+Note that this has been obsolete since Linux 2.4.30.
  .TP
  \fIstartcode\fP %lu
  The address above which program text can run.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
