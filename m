From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: crypt.3: inaccurate instructions listed for crypt_r
Date: Thu, 15 Sep 2011 06:19:02 +0200
Message-ID: <CAKgNAkine=2=Z0Ds_z82E2iAjko8zoRsQXsDOarO7ob=gsxUvQ@mail.gmail.com>
References: <alpine.LNX.2.01.1010142039540.20852@obet.zrqbmnf.qr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LNX.2.01.1010142039540.20852-SHaQjdQMGhDmsUXKMKRlFA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jan,

On Thu, Oct 14, 2010 at 8:42 PM, Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org> wrote:
> Hi,
>
>
> the crypt.3 is a bit confusing on crypt_r (looking at distro-provided
> man-pages-3.25 here). The manpage says to use _XOPEN_SOURCE and
> unistd.h, but the crypt_r function, being a GNU extension, requires
> #define _GNU_SOURCE and #include <crypt.h> instead.

Thanks. I made that fix for man-pages-3.33.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
