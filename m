From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drand48.3: ATTRIBUTES: Note functions that are not thread-safe
Date: Tue, 21 May 2013 13:15:51 +0200
Message-ID: <519B5767.5050203@gmail.com>
References: <1369027980-11810-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369027980-11810-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/20/13 07:33, Peng Haitao wrote:
> The functions drand48(), erand48(), lrand48(), nrand48(),
> mrand48(), jrand48(), srand48(), seed48() and lcong48() are
> not thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thanks, Peng. Applied in my local branch for this work.

Cheers,

Michael


> ---
>  man3/drand48.3 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man3/drand48.3 b/man3/drand48.3
> index 3dad8fc..d65ae3d 100644
> --- a/man3/drand48.3
> +++ b/man3/drand48.3
> @@ -201,6 +201,21 @@ has been called, a subsequent call to either
>  or
>  .BR seed48 ()
>  will restore the standard values of \fIa\fP and \fIc\fP.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR drand48 (),
> +.BR erand48 (),
> +.BR lrand48 (),
> +.BR nrand48 (),
> +.BR mrand48 (),
> +.BR jrand48 (),
> +.BR srand48 (),
> +.BR seed48 (),
> +and
> +.BR lcong48 ()
> +functions use a global state of the random number generator,
> +so they are not thread-safe.
>  .SH CONFORMING TO
>  SVr4, POSIX.1-2001.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
