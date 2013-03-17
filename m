From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getttyent.3: Add description of the functions are not thread-safe
Date: Sun, 17 Mar 2013 11:59:24 +0100
Message-ID: <CAKgNAkg+HubwMnanJX4zuuRzYm=acLWPCpn8-0LDTym5nVeDBw@mail.gmail.com>
References: <4E71C71F.1000400@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E71C71F.1000400-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Sep 15, 2011 at 11:36 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
>
> The function getttyent() returns a pointer to the static variable, so it is not
> thread-safe. The functions setttyent() and endttyent() use a static variable "tf",
> so they are not thread-safe. The function getttynam() calls unsafe function
> getttyent(), so it is not thread-safe.

Applied. Thanks!

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getttyent.3 |   19 ++++++++++++++++++-
>  1 files changed, 18 insertions(+), 1 deletions(-)
>
> diff --git a/man3/getttyent.3 b/man3/getttyent.3
> index 1cf8ebc..a4e9b17 100644
> --- a/man3/getttyent.3
> +++ b/man3/getttyent.3
> @@ -1,7 +1,7 @@
>  .\"  Copyright 2002 walter harms (walter.harms-jNDFPZUTrfTUvfpBxBsQfasoZZ7OtMbqG9Ur7JDdleE@public.gmane.org)
>  .\"  Distributed under GPL
>  .\"
> -.TH GETTTYENT 3 2002-07-18  "GNU" "Linux Programmer's Manual"
> +.TH GETTTYENT 3 2011-09-15  "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  getttyent, getttynam, setttyent, endttyent \- get ttys file entry
>  .SH SYNOPSIS
> @@ -66,6 +66,23 @@ can be:
>  #define TTY_ON     0x01  /* enable logins (start ty_getty program) */
>  #define TTY_SECURE 0x02  /* allow UID 0 to login */
>  .fi
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getttyent ()
> +returns a pointer to the static variable, so it is not thread-safe.
> +.LP
> +The
> +.BR setttyent ()
> +and
> +.BR endttyent ()
> +use a static variable, so they are not thread-safe.
> +.LP
> +The
> +.BR getttynam ()
> +calls thread-unsafe function
> +.BR getttyent ()
> +so it is not thread-safe.
>  .SH "CONFORMING TO"
>  Not in POSIX.1-2001.
>  Present on the BSDs, and perhaps other systems.
> --
> 1.7.1
>
> --
> Best Regards,
> Peng Haitao
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
