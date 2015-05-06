From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug about UNIX_PATH_MAX in the manpage of Unix(7)
Date: Wed, 06 May 2015 10:24:46 +0200
Message-ID: <5549CFCE.3090103@gmail.com>
References: <4CD173D2.8020003@telecom-bretagne.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4CD173D2.8020003-+sCGM1tQGJejRLBOWInFB+yrfmlZI2zM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Lohr <Christophe.Lohr-+sCGM1tQGJejRLBOWInFB+yrfmlZI2zM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Christophe,

On 11/03/2010 03:38 PM, Christophe Lohr wrote:
> File: /usr/share/man/man7/unix.7.gz
> Version: 3.25-1
> System: debian testing
> 
> 
> Hi,
>    Manpage of Unix(7) says:
> 
> ---------------------------------
> |    SYNOPSIS
> |           #include <sys/socket.h>
> |           #include <sys/un.h>
> (../..)
> |    DESCRIPTION
> (../..)
> |
> |       Address Format
> |           A Unix domain socket address is represented in the following 
> structure:
> |
> |               #define UNIX_PATH_MAX    108
> |
> |               struct sockaddr_un {
> |                   sa_family_t sun_family;               /* AF_UNIX */
> |                   char        sun_path[UNIX_PATH_MAX];  /* pathname */
> |               };
> ---------------------------------
> 
> 
> However, UNIX_PATH_MAX is not defined in the mentioned include <sys/un.h>.
> In fact, these definitions come from <linux/un.h>.
> 
> There is a confusion between the two includes (sys/un.h and linux/un.h).
> 
> Maybe they should be merged, but today it is not the case... :-(

Long after the fact... I've removed mention of UNIX_PATH_MAX from the page.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
