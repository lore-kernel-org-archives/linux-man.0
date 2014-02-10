From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ffix: add space between function and () if BR or IR
Date: Mon, 10 Feb 2014 11:04:30 +0100
Message-ID: <52F8A42E.1060708@gmail.com>
References: <1391861950-6509-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391861950-6509-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

I'll put together a script to make these and other checks.

Cheers,

Michael



On 02/08/2014 01:19 PM, Simon Paillard wrote:
> Detected through the regex:
> 	git grep -P '^\.(BR|IR) [\w]*\([\d]*\)$'
> ---
>  man3/getgrent.3 | 6 +++---
>  man3/getpwent.3 | 6 +++---
>  man7/socket.7   | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/man3/getgrent.3 b/man3/getgrent.3
> index d666bd3..b357cda 100644
> --- a/man3/getgrent.3
> +++ b/man3/getgrent.3
> @@ -155,13 +155,13 @@ local group database file
>  .SH ATTRIBUTES
>  .SS Multithreading (see pthreads(7))
>  The
> -.BR getgrent()
> +.BR getgrent ()
>  function is not thread-safe.
>  .LP
>  The
> -.BR setgrent()
> +.BR setgrent ()
>  and
> -.BR endgrent()
> +.BR endgrent ()
>  functions are thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
> diff --git a/man3/getpwent.3 b/man3/getpwent.3
> index de31c60..fb78171 100644
> --- a/man3/getpwent.3
> +++ b/man3/getpwent.3
> @@ -154,13 +154,13 @@ local password database file
>  .SH ATTRIBUTES
>  .SS Multithreading (see pthreads(7))
>  The
> -.BR getpwent()
> +.BR getpwent ()
>  function is not thread-safe.
>  .LP
>  The
> -.BR setpwent()
> +.BR setpwent ()
>  and
> -.BR endpwent()
> +.BR endpwent ()
>  functions are thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001.
> diff --git a/man7/socket.7 b/man7/socket.7
> index 9421686..9e2c23d 100644
> --- a/man7/socket.7
> +++ b/man7/socket.7
> @@ -452,7 +452,7 @@ For more information see
>  This option, which is currently supported only for
>  .BR unix (7)
>  sockets, sets the value of the "peek offset" for the
> -.BR recv(2)
> +.BR recv (2)
>  system call when used with
>  .BR MSG_PEEK
>  flag.
> @@ -460,7 +460,7 @@ flag.
>  When this option is set to a negative value
>  (it is set to \-1 for all new sockets),
>  traditional behavior is provided:
> -.BR recv(2)
> +.BR recv (2)
>  with the
>  .BR MSG_PEEK
>  flag will peek data from the front of the queue.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
