From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sysconf.3: Document _SC_NGROUPS_MAX
Date: Tue, 28 Oct 2014 15:27:32 +0100
Message-ID: <544FA7D4.1030100@gmail.com>
References: <20141020080850.GA22821@thin>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141020080850.GA22821@thin>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/20/2014 10:08 AM, Josh Triplett wrote:
> Already documented in getgroups(2), but not in sysconf(3).

Applied. Thanks, Josh.

Cheers,

Michael



> Signed-off-by: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
> ---
>  man3/sysconf.3 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/man3/sysconf.3 b/man3/sysconf.3
> index dc1ea5c..9f6c5c0 100644
> --- a/man3/sysconf.3
> +++ b/man3/sysconf.3
> @@ -154,6 +154,9 @@ Must not be less than
>  .B _POSIX_LOGIN_NAME_MAX
>  (9).
>  .TP
> +.BR NGROUPS_MAX " - " _SC_NGROUPS_MAX
> +Maximum number of supplementary group IDs.
> +.TP
>  .BR "" "clock ticks - " _SC_CLK_TCK
>  The number of clock ticks per second.
>  The corresponding variable is obsolete.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
