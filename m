From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mprotect(2)'s first argument is not const
Date: Mon, 13 Aug 2012 14:02:58 +0200
Message-ID: <CAKgNAkhbzonQzgcGE6imyQRzrZkpm=1vvSNM3VPqEARRQe5eFg@mail.gmail.com>
References: <0896F8203AB51141A0B652531431CACB8F8D33@smbx.decode.is>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0896F8203AB51141A0B652531431CACB8F8D33-JVeYhverVm8nSszU+QDW7Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <Rasmus.Villemoes-RUss/tIHhir1P9xLtpHBDw@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Rasmus,

On Mon, Jul 9, 2012 at 4:05 PM, Rasmus Villemoes
<Rasmus.Villemoes-RUss/tIHhir1P9xLtpHBDw@public.gmane.org> wrote:
> Both my system's man-pages (3.22) and the latest online (3.41) shows
>
>   int mprotect(const void *addr, size_t len, int prot);
>
> as the prototype for mprotect(2). However, POSIX [1] and the actual sys/mman.h (on all the systems I checked) do not have the const qualifier on the first argument.
>
> [1] http://pubs.opengroup.org/onlinepubs/009604499/functions/mprotect.html

Thanks. That error has been there for *many* years. Fixed now,

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
