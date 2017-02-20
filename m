From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH] sigprocmask.2: do not specify an exact value of rt_sigprocmask's
 4th argument
Date: Mon, 20 Feb 2017 09:17:07 +0100
Message-ID: <58AAA603.6020400@bfs.de>
References: <20170219211302.GA30235@altlinux.org>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170219211302.GA30235-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 19.02.2017 22:13, schrieb Dmitry V. Levin:
> As sizeof(kernel_sigset_t) is not the same for all architectures,
> it would be better not to mention any numbers as its value.
> 
> Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
> ---
>  man2/sigprocmask.2 | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/man2/sigprocmask.2 b/man2/sigprocmask.2
> index 8388340..6379a4d 100644
> --- a/man2/sigprocmask.2
> +++ b/man2/sigprocmask.2
> @@ -202,10 +202,11 @@ which specifies the size in bytes of the signal sets in
>  .IR set
>  and
>  .IR oldset .
> -This argument is currently required to have the value 8
> -(
> -.IR sizeof(kernel_sigset_t)
> -).
> +This argument is currently required to have a fixed value
> +(equal to
> +.IR sizeof(kernel_sigset_t) ).
> +.\" sizeof(kernel_sigset_t) == _NSIG / 8,
> +.\" which equals to 8 on most architectures, but e.g. on MIPS it's 16.
>  
>  The glibc
>  .BR sigprocmask ()


why not add this information like:
Note: sizeof(kernel_sigset_t) is not the same for all architectures

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
