From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: stat(2): use lstat instead of stat in the example?
Date: Tue, 17 Oct 2017 23:02:06 +0200
Message-ID: <CAKgNAkjDbzPLkLxefsuJGR0tkpbHQuqO_o6mwE0pwU4VuE2B_A@mail.gmail.com>
References: <4973d2be-3dda-5379-5c75-18f2ba7861cf@abelko.se>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4973d2be-3dda-5379-5c75-18f2ba7861cf-Yzag3CzIk2SzQB+pC5nmwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Knutsson <richard.knutsson-Yzag3CzIk2SzQB+pC5nmwQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Richard

On 16 October 2017 at 15:27, Richard Knutsson
<richard.knutsson-Yzag3CzIk2SzQB+pC5nmwQ@public.gmane.org> wrote:
> Hi,
>
> A college of mine was having a problem with the example-code on the
> stat/lstat/fstat-page, since it would never report a file as "symlink". It
> was a mistake on his part but is there a reason to use stat() instead of
> lstat() when the latter gives the expected result, IMHO?

I'm inclined to agree, and I've made the change in the page.

Thanks for the report!

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
