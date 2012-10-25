From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getdomainname.2: point out it is related to NIS and not DNS
Date: Thu, 25 Oct 2012 12:27:37 +0200
Message-ID: <CAKgNAkhob7PORQzCxyKtrDbg3B3uxrZ0xfAUPkE4nE55xmNMbg@mail.gmail.com>
References: <1351028752-10662-1-git-send-email-spaillard@debian.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351028752-10662-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Oct 23, 2012 at 11:45 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> Reported-by: Lars Wirzenius <liw-X3B1VOXEql0@public.gmane.org>
> See http://bugs.debian.org/295635

Thanks Simon. Applied for 3.44.

Cheers,

Michael

> ---
>  man2/getdomainname.2 |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man2/getdomainname.2 b/man2/getdomainname.2
> index 0e24b18..b0ee32c 100644
> --- a/man2/getdomainname.2
> +++ b/man2/getdomainname.2
> @@ -28,7 +28,7 @@
>  .\"
>  .TH GETDOMAINNAME 2 2009-09-27 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> -getdomainname, setdomainname \- get/set domain name
> +getdomainname, setdomainname \- get/set NIS domain name
>  .SH SYNOPSIS
>  .B #include <unistd.h>
>  .sp
> @@ -49,7 +49,7 @@ _BSD_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE\ <\ 500)
>  .RE
>  .ad
>  .SH DESCRIPTION
> -These functions are used to access or to change the domain name of the
> +These functions are used to access or to change the NIS domain name of the
>  host system.
>
>  .BR setdomainname ()
> --
> 1.7.10.4
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
