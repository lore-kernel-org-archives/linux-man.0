From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] seekdir.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 13 Sep 2013 06:41:23 +0200
Message-ID: <52329773.60308@gmail.com>
References: <1378698528-14408-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378698528-14408-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Peng Haitao. Applied.

Cheers,

Michael


On 09.09.2013 05:48, Peng Haitao wrote:
> The function seekdir() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/seekdir.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/seekdir.3 b/man3/seekdir.3
> index 768dcbd..7eeb822 100644
> --- a/man3/seekdir.3
> +++ b/man3/seekdir.3
> @@ -28,7 +28,7 @@
>  .\"     386BSD man pages
>  .\" Modified Sat Jul 24 18:25:21 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\"
> -.TH SEEKDIR 3  2013-03-24 "" "Linux Programmer's Manual"
> +.TH SEEKDIR 3  2013-09-09 "" "Linux Programmer's Manual"
>  .SH NAME
>  seekdir \- set the position of the next readdir() call in the directory
>  stream.
> @@ -61,6 +61,11 @@ argument should be a value returned by a previous call to
>  The
>  .BR seekdir ()
>  function returns no value.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR seekdir ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  4.3BSD, POSIX.1-2001.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
