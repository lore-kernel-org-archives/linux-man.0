From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] telldir.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 02 Sep 2013 07:47:46 +0200
Message-ID: <52242682.3060709@gmail.com>
References: <1378099851-7755-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378099851-7755-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/02/13 07:30, Peng Haitao wrote:
> The function telldir() is thread safe.

Applied. Thanks.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/telldir.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/telldir.3 b/man3/telldir.3
> index 1b241b6..c61f1f2 100644
> --- a/man3/telldir.3
> +++ b/man3/telldir.3
> @@ -27,7 +27,7 @@
>  .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
>  .\"     386BSD man pages
>  .\" Modified Sat Jul 24 17:48:42 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
> -.TH TELLDIR 3  2013-03-24 "" "Linux Programmer's Manual"
> +.TH TELLDIR 3  2013-09-02 "" "Linux Programmer's Manual"
>  .SH NAME
>  telldir \- return current location in directory stream
>  .SH SYNOPSIS
> @@ -61,6 +61,11 @@ is set appropriately.
>  .TP
>  .B EBADF
>  Invalid directory stream descriptor \fIdirp\fP.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR telldir ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  4.3BSD, POSIX.1-2001.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
