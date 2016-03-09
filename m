From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getaddrinfo.3: require POSIX.1-2001
Date: Wed, 9 Mar 2016 02:23:07 +0100
Message-ID: <56DF7AFB.5060403@gmail.com>
References: <mvmio8nmo0n.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <mvmio8nmo0n.fsf-8jEJWzg51KSXcDkGTvBoYw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Orion Poplawski <orion-CVdf0l11yl+B+jHODAdFcQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Andreas,

Sorry for the delay,

On 08/10/2015 12:33 PM, Andreas Schwab wrote:
> Since glibc 2.22 getaddrinfo etc. are only declared for POSIX.1-2001 or later.
> 
> Signed-off-by: Andreas Schwab <schwab-l3A5Bk7waGM@public.gmane.org>
> ---
>  man3/getaddrinfo.3 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/getaddrinfo.3 b/man3/getaddrinfo.3
> index 7bf815a..a746bf4 100644
> --- a/man3/getaddrinfo.3
> +++ b/man3/getaddrinfo.3
> @@ -70,7 +70,8 @@ Feature Test Macro Requirements for glibc (see
>  .BR freeaddrinfo (),
>  .BR gai_strerror ():
>  .RS 4
> -_POSIX_C_SOURCE\ >=\ 1 || _XOPEN_SOURCE || _POSIX_SOURCE
> +_XOPEN_SOURCE\ >=\ 600 || _POSIX_C_SOURCE\ >=\ 200112L
> +.\" since glibc 2.22
>  .RE
>  .ad b
>  .SH DESCRIPTION

Orion also posted a very similar patch. I updated the page,
but just mentioned "_POSIX_C_SOURCE >= 200112L", since
"_XOPEN_SOURCE >= 600" implies "_POSIX_C_SOURCE >= 200112L".
(For the next release, the FTM descriptions in many pages 
have been simplified in this way.)

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
