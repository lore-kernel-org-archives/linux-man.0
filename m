From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cabs.3:ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 6 Jan 2015 15:11:30 +0100
Message-ID: <CAKgNAkhue0VsaTVqZdh5gmo44W3xta8rbXaQWzuK-x9Cq5MXwg@mail.gmail.com>
References: <1420004800-6461-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420004800-6461-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Dec 31, 2014 at 6:46 AM, Ma Shimiao
<mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> The function cabs(), cabsf() and cabsl() are thread safe.

Hello Ma Shimiao,

I missed replying to this mail earlier. This patch has also been
applied (in my local branch).

Cheers,

Michael



> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/cabs.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/man3/cabs.3 b/man3/cabs.3
> index e6c11f2..e43e30e 100644
> --- a/man3/cabs.3
> +++ b/man3/cabs.3
> @@ -25,6 +25,20 @@ function returns the absolute value of the complex number
>  The result is a real number.
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw24 lb lb
> +l l l.
> +Interface      Attribute       Value
> +T{
> +.BR cabs (),
> +.BR cabsf (),
> +.BR cabsl ()
> +T}     Thread safety   MT-Safe
> +.TE
>  .SH CONFORMING TO
>  C99.
>  .SH NOTES
> --
> 1.8.3.1
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
