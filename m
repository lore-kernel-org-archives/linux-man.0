From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clone.2: Document that clone silently ignores CLONE_PID
 and CLONE_STOPPED
Date: Fri, 27 Feb 2015 07:42:44 +0100
Message-ID: <54F011E4.1020502@gmail.com>
References: <20150227004118.GA15530@jtriplet-mobl1>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150227004118.GA15530@jtriplet-mobl1>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/27/2015 01:41 AM, Josh Triplett wrote:
> Normally, system calls return EINVAL for flags they don't support.
> Explicitly document that clone does *not* produce an error for these two
> obsolete flags.

Thanks, Josh! Applied.

Cheers,

Michael



> Signed-off-by: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
> ---
>  man2/clone.2 | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/clone.2 b/man2/clone.2
> index 91c3684..10cef7d 100644
> --- a/man2/clone.2
> +++ b/man2/clone.2
> @@ -534,7 +534,8 @@ This is good for hacking the system, but otherwise
>  of not much use.
>  Since 2.3.21 this flag can be
>  specified only by the system boot process (PID 0).
> -It disappeared in Linux 2.5.16.
> +It disappeared in Linux 2.5.16.  Since then, the kernel silently ignores it
> +without error.
>  .TP
>  .BR CLONE_PTRACE " (since Linux 2.2)"
>  If
> @@ -599,7 +600,8 @@ This flag was
>  from Linux 2.6.25 onward,
>  and was
>  .I removed
> -altogether in Linux 2.6.38.
> +altogether in Linux 2.6.38.  Since then, the kernel silently ignores it without
> +error.
>  .\" glibc 2.8 removed this defn from bits/sched.h
>  .TP
>  .BR CLONE_SYSVSEM " (since Linux 2.5.10)"
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
