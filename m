From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sendfile.2: tfix
Date: Tue, 5 May 2015 16:05:08 +0200
Message-ID: <CAKgNAkgj3_b-MB7TzDHpgyOqgmjXp5jK=Lv+QEvk2ppZYKbgvA@mail.gmail.com>
References: <20150505131356.GA22385@glebfm.cloud.tilaa.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150505131356.GA22385-N9aU+Tdk7XkoO014n+3aBsY9il7ykmry@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 5 May 2015 at 15:14, Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org> wrote:
> Signed-off-by: Gleb Fotengauer-Malinovskiy <glebfm-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>

Thanks, Gleb. Applied.

Cheers,

Michael


> ---
>  man2/sendfile.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man2/sendfile.2 b/man2/sendfile.2
> index efe61ec..e32fda5 100644
> --- a/man2/sendfile.2
> +++ b/man2/sendfile.2
> @@ -141,7 +141,7 @@ Insufficient memory to read from
>  .IR in_fd .
>  .SH VERSIONS
>  .BR sendfile ()
> -ifirst appeared in Linux 2.2.
> +first appeared in Linux 2.2.
>  The include file
>  .I <sys/sendfile.h>
>  is present since glibc 2.1.
> --
> glebfm



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
