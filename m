From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] prctl(2): PR_SET_MM: document arg4/arg5 zero behavior
Date: Wed, 19 Apr 2017 15:31:35 +0200
Message-ID: <bc7fa6f5-de73-ae79-f2ee-e3bcbf3a2b18@gmail.com>
References: <20170215201443.448-1-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170215201443.448-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 02/15/2017 09:14 PM, Mike Frysinger wrote:
> The kernel will immediately reject calls where arg4/arg5 are not zero.
> See kernel/sys.c:prctl_set_mm().

Thanks, Mike. Applied.

Cheers,

Michael

> Signed-off-by: Mike Frysinger <vapier-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  man2/prctl.2 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index 97cf21a4c558..c91d328e5aa1 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -515,6 +515,11 @@ The value in
>  is one of the options below, while
>  .I arg3
>  provides a new value for the option.
> +The
> +.I arg4
> +and
> +.I arg5
> +arguments must be zero if unused.
>  .RS
>  .TP
>  .BR PR_SET_MM_START_CODE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
