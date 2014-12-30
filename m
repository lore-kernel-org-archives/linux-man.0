From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cacos.3:ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 30 Dec 2014 14:07:59 +0100
Message-ID: <54A2A3AF.4050800@gmail.com>
References: <1416972999-23249-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416972999-23249-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC expanded]

Hello Ma Shimiao,

Sorry for the delay on your patches, but in any case, we better start
with a meta-point: Am I correct to understand that you work with 
Peng Haitao and Qian Lei?


On 11/26/2014 04:36 AM, Ma Shimiao wrote:
> The function cacos(), cacosf() and cacosl() are thread safe.

I've applied this patch in my local branch. (The branch remains pending
pending me confirming the state of the attributes reformatting work and
also consistency with glibc manual mark up.)

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/cacos.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/cacos.3 b/man3/cacos.3
> index 36c7bc1..3550a1c 100644
> --- a/man3/cacos.3
> +++ b/man3/cacos.3
> @@ -35,6 +35,20 @@ One has:
>  .fi
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw28 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR cacos (),
> +.BR cacosf (),
> +.BR cacosl ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  C99.
>  .SH EXAMPLE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
