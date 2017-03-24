From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] sigprocmask.2: do not specify an exact value of
 rt_sigprocmask's 4th argument
Date: Fri, 24 Mar 2017 15:40:32 +0100
Message-ID: <77c9ff20-d01c-1b7d-e2ff-997d39aa85ef@gmail.com>
References: <20170219211302.GA30235@altlinux.org> <58AAA603.6020400@bfs.de>
 <20170220154327.GA9511@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170220154327.GA9511-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>, walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Dmitry

On 02/20/2017 04:43 PM, Dmitry V. Levin wrote:
> As sizeof(kernel_sigset_t) is not the same for all architectures,
> it would be better not to mention any numbers as its value.

Thanks! Applied.

Cheers,

Michael


> Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
> ---
> v2: mention that sizeof(kernel_sigset_t) is architecture specific.
> 
>  man2/sigprocmask.2 | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/man2/sigprocmask.2 b/man2/sigprocmask.2
> index 8388340..499fd0c 100644
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
> +This argument is currently required to have a fixed architecture specific value
> +(equal to
> +.IR sizeof(kernel_sigset_t) ).
> +.\" sizeof(kernel_sigset_t) == _NSIG / 8,
> +.\" which equals to 8 on most architectures, but e.g. on MIPS it's 16.
>  
>  The glibc
>  .BR sigprocmask ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
