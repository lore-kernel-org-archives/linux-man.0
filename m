From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] bindresvport.3: Add description of the function is thread-safe
Date: Sun, 17 Mar 2013 12:06:31 +0100
Message-ID: <CAKgNAkiJBGhMTP-Vqu_cVn2kAaMhHn0AsTpYkQPFQ-zUvyLUkw@mail.gmail.com>
References: <1354607342-5199-1-git-send-email-penght@cn.fujitsu.com> <1354607730-5326-1-git-send-email-penght@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354607730-5326-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Peng,

On Tue, Dec 4, 2012 at 8:55 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> The function bindresvport() uses lock to protect static variable,
> so it is thread-safe. The patch can refer to URL:
> http://sourceware.org/git/?p=glibc.git;a=commit;h=f6da27e53695ad1cc0e2a9490358decbbfdff5e5

Now we get to an interesting case. If I understand right,
bindresvport() was not thread-safe, but you have now made it so,
correct?

In this case, the ATTRIBUTES patch should say something like:

    Before glibc 2.??, bindresvport() was not thread-safe.
    Since glibc 2.??, it is thread-safe.

And the changelog should include the information you gave above.
Could you please resubmit this patch.

Cheers,

Michael

> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/bindresvport.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/man3/bindresvport.3 b/man3/bindresvport.3
> index d58c33d..facc297 100644
> --- a/man3/bindresvport.3
> +++ b/man3/bindresvport.3
> @@ -24,7 +24,7 @@
>  .\" 2007-05-31, mtk: Rewrite and substantial additional text.
>  .\" 2008-12-03, mtk: Rewrote some pieces and fixed some errors
>  .\"
> -.TH BINDRESVPORT 3  2008-12-03 "" "Linux Programmer's Manual"
> +.TH BINDRESVPORT 3  2012-12-04 "" "Linux Programmer's Manual"
>  .SH NAME
>  bindresvport \- bind a socket to a privileged IP port
>  .SH SYNOPSIS
> @@ -86,6 +86,11 @@ is not NULL and
>  .I sin->sin_family
>  is not
>  .BR AF_INET .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR bindresvport ()
> +function is thread-safe.
>  .SH "CONFORMING TO"
>  Not in POSIX.1-2001.
>  Present on the BSDs, Solaris, and many other systems.
> --
> 1.8.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
