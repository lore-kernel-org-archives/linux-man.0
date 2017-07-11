From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] acosh.3, asinh.3, atanh.3: Remove C89 designation.
Date: Tue, 11 Jul 2017 10:01:53 +0200
Message-ID: <181d2cb7-a074-0bdd-f861-ae2618c24139@gmail.com>
References: <20170711053106.4113-1-alexhenrie24@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170711053106.4113-1-alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Henrie <alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, piotr.caban-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hverbeet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Alex,

On 07/11/2017 07:31 AM, Alex Henrie wrote:
> See https://bugzilla.kernel.org/show_bug.cgi?id=196319

I confirmed by reading a C90 draft. Patch applied.

Thanks!

Michael


> Signed-off-by: Alex Henrie <alexhenrie24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man3/acosh.3 | 2 +-
>  man3/asinh.3 | 2 +-
>  man3/atanh.3 | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/acosh.3 b/man3/acosh.3
> index 45429bf45..ac34511eb 100644
> --- a/man3/acosh.3
> +++ b/man3/acosh.3
> @@ -132,7 +132,7 @@ C99, POSIX.1-2001, POSIX.1-2008.
>  The variant returning
>  .I double
>  also conforms to
> -SVr4, 4.3BSD, C89.
> +SVr4, 4.3BSD.
>  .SH SEE ALSO
>  .BR asinh (3),
>  .BR atanh (3),
> diff --git a/man3/asinh.3 b/man3/asinh.3
> index 2c8dc2d28..8e211c1e8 100644
> --- a/man3/asinh.3
> +++ b/man3/asinh.3
> @@ -117,7 +117,7 @@ C99, POSIX.1-2001, POSIX.1-2008.
>  The variant returning
>  .I double
>  also conforms to
> -SVr4, 4.3BSD, C89.
> +SVr4, 4.3BSD.
>  .SH SEE ALSO
>  .BR acosh (3),
>  .BR atanh (3),
> diff --git a/man3/atanh.3 b/man3/atanh.3
> index 463fe0237..b9c8ac33b 100644
> --- a/man3/atanh.3
> +++ b/man3/atanh.3
> @@ -151,7 +151,7 @@ C99, POSIX.1-2001, POSIX.1-2008.
>  The variant returning
>  .I double
>  also conforms to
> -SVr4, 4.3BSD, C89.
> +SVr4, 4.3BSD.
>  .SH BUGS
>  In glibc 2.9 and earlier,
>  .\" Bug: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6759
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
