From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] set_mempolicy.2: wfix
Date: Wed, 23 Apr 2014 14:40:18 +0200
Message-ID: <5357B4B2.3060401@gmail.com>
References: <5357AAF3.2010200@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5357AAF3.2010200-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/23/2014 01:58 PM, Peter Schiffer wrote:
> Hi Michael,
> 
> sending minor wording fix for set_mempolicy(2) man page.

Thanks, Peter. Applied. (But, I prefer inline patches.)

Cheers,

Michael

diff --git a/man2/set_mempolicy.2 b/man2/set_mempolicy.2
index f891cc4..843208c 100644
--- a/man2/set_mempolicy.2
+++ b/man2/set_mempolicy.2
@@ -99,7 +99,7 @@ are:
 A nonempty
 .I nodemask
 specifies physical node ids.
-Linux does will not remap the
+Linux will not remap the
 .I nodemask
 when the process moves to a different cpuset context,
 nor when the set of nodes allowed by the process's

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
