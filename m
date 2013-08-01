From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] formatting fixes in bootparam.7, wcpncpy.3, wcsncmp.3
Date: Thu, 01 Aug 2013 11:35:54 +0200
Message-ID: <51FA2BFA.30904@gmail.com>
References: <CALhU9tn_Fx5SjFWT-=gQdPLgjWH=7iw4mixRJcQkGpq1T=u4qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tn_Fx5SjFWT-=gQdPLgjWH=7iw4mixRJcQkGpq1T=u4qA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/30/13 22:40, Akihiro MOTOKI wrote:
> This patch fixes some formatting issues.
> 
> * wcpncpy.3 : "1" is not a variable and it is not better to be underlined.

(Was already fixed.)

> * wcpncmp.3 : "i" of "(i" needs to be underlined.

Applied; thanks.

> * bootparam.7 : a comma should not be underlined

(Was already fixed.)

Cheers,

Michael



> diff --git a/manual/LDP_man-pages/original/man3/wcpncpy.3
> b/manual/LDP_man-pages/original/man3/wcpncpy.3
> index f3bfbfa..910dd6f 100644
> --- a/manual/LDP_man-pages/original/man3/wcpncpy.3
> +++ b/manual/LDP_man-pages/original/man3/wcpncpy.3
> @@ -89,7 +89,7 @@ characters at
>  .SH RETURN VALUE
>  .BR wcpncpy ()
>  returns a pointer to the last wide character written, that is,
> -.IR dest + n \- 1" .
> +.IR dest + n \-1.
>  .SH CONFORMING TO
>  POSIX.1-2008.
>  .SH SEE ALSO
> diff --git a/manual/LDP_man-pages/original/man3/wcsncmp.3
> b/manual/LDP_man-pages/original/man3/wcsncmp.3
> index 311462d..c1903e0 100644
> --- a/manual/LDP_man-pages/original/man3/wcsncmp.3
> +++ b/manual/LDP_man-pages/original/man3/wcsncmp.3
> @@ -62,7 +62,7 @@ greater than
>  It returns an integer less than zero if at the first
>  differing position
>  .I i
> -.RI (i
> +.RI ( i
>  <
>  .IR n ),
>  the corresponding
> diff --git a/manual/LDP_man-pages/original/man7/bootparam.7
> b/manual/LDP_man-pages/original/man7/bootparam.7
> index 440fad5..db60026 100644
> --- a/manual/LDP_man-pages/original/man7/bootparam.7
> +++ b/manual/LDP_man-pages/original/man7/bootparam.7
> @@ -188,7 +188,7 @@ use 'root=/dev/fd1'.
> 
>  The root device can be specified symbolically or numerically.
>  A symbolic specification has the form
> -.I /dev/XXYN,
> +.IR /dev/XXYN ,
>  where XX designates
>  the device type ('hd' for ST-506 compatible hard disk, with Y in
>  \&'a'-'d'; 'sd' for SCSI compatible disk, with Y in 'a'-'e';
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
