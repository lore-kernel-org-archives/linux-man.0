From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getpass.3: Add description of the function is not thread-safe
Date: Sun, 17 Mar 2013 11:53:58 +0100
Message-ID: <CAKgNAkgsaDrtACxjSru=ogMiYEa=rQDnkKeRaw7hW-4gcQBS9g@mail.gmail.com>
References: <4E65EA98.6070807@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E65EA98.6070807-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Sep 6, 2011 at 11:40 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
>
> The function getpass() uses a static variable "buf", so it is not thread-safe.

Applied.

Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getpass.3 |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/man3/getpass.3 b/man3/getpass.3
> index d363ec4..d07a323 100644
> --- a/man3/getpass.3
> +++ b/man3/getpass.3
> @@ -20,7 +20,7 @@
>  .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111,
>  .\" USA.
>  .\"
> -.TH GETPASS 3  2010-09-20 "Linux" "Linux Programmer's Manual"
> +.TH GETPASS 3  2011-09-06 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  getpass \- get a password
>  .SH SYNOPSIS
> @@ -86,6 +86,11 @@ The process does not have a controlling terminal.
>  .\" A
>  .\" .BR getpass ()
>  .\" function appeared in Version 7 AT&T UNIX.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getpass ()
> +function is not thread-safe.
>  .SH "CONFORMING TO"
>  Present in SUSv2, but marked LEGACY.
>  Removed in POSIX.1-2001.
> --
> 1.7.1
>
> --
> Best Regards,
> Peng Haitao
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
