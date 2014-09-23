From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pthread_attr_setinheritsched.3: Reformat thread-safety
 information
Date: Tue, 23 Sep 2014 06:24:02 +0200
Message-ID: <5420F5E2.1090604@gmail.com>
References: <1411369092-8990-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411369092-8990-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied in my attributes_reformat_2
branch.

Cheers,

Michael

On 09/22/2014 08:58 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pthread_attr_setinheritsched.3 | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/man3/pthread_attr_setinheritsched.3 b/man3/pthread_attr_setinheritsched.3
> index 84c5b40..76ad004 100644
> --- a/man3/pthread_attr_setinheritsched.3
> +++ b/man3/pthread_attr_setinheritsched.3
> @@ -108,12 +108,18 @@ error ("attempt was made to set the attribute to an unsupported value") for
>  .\" .SH VERSIONS
>  .\" Available since glibc 2.0.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
> -The
> -.BR pthread_attr_setinheritsched ()
> -and
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw31 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR pthread_attr_setinheritsched (),
>  .BR pthread_attr_getinheritsched ()
> -functions are thread-safe.
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH BUGS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
