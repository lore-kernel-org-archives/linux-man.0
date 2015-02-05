From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptrace.2: Explain behaviour should ptrace tracer call
 execve
Date: Thu, 05 Feb 2015 14:24:22 +0100
Message-ID: <54D36F06.6080109@gmail.com>
References: <50524A33.2030600@ubuntu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50524A33.2030600-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/13/2012 11:03 PM, James Hunt wrote:
> This behaviour was verified by reading the kernel source and confirming
> the behaviour using a test program.
> 
> Applies to latest git repo.

Thanks, James. Applied.

Cheers,

Michael


---
 man2/ptrace.2 |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index c45e569..d051358 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -1660,6 +1660,9 @@ In Linux kernels before 2.6.26,
 .BR init (8),
 the process with PID 1, may not be traced.
 .LP
+A tracees parent continues to be the tracer even if that tracer calls
+.BR execve (2).
+.LP
 The layout of the contents of memory and the USER area are
 quite operating-system- and architecture-specific.
 The offset supplied, and the data returned,

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
