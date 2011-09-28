From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Common way of explaining null-terminated strings
Date: Wed, 28 Sep 2011 07:41:34 +0200
Message-ID: <CAKgNAkh+FZxN_3PnbFx5oEnTLg-qLiz45GXMKSHVxrWmM195Hg@mail.gmail.com>
References: <4E823190.1070100@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E823190.1070100-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On Tue, Sep 27, 2011 at 10:26 PM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hi Michael
>
> I noticed there are a few different ways of explaining the null-terminating
> '\0' character.

Yes. There is some inconsistency.

> Just thinking if this could be standardised, and the same
> description of this used across all the string functions (and wide string):

A good idea.

> e.g.:
>
> http://man7.org/linux/man-pages/online/pages/man3/strnlen.3.html
>
> "terminating '\0' character"
>
> and also:
>
> "if there is no '\0' character"
>
>
> My opinion would be that the phrase "null terminator '\0'" could be used for
> the first mention, and then later references could just say "if there is no
> null terminator".
>
> To give an example of a page with a different way of explaining:
>
> http://man7.org/linux/man-pages/online/pages/man3/strncat.3.html
>
> "plus the terminating null byte"
>
> http://man7.org/linux/man-pages/online/pages/man3/strcpy.3.html
> "including the terminating null byte ('\0')"
>
> "If there is no null byte"
>
> Perhaps this could even be worth adding to the overview section:
> http://man7.org/linux/man-pages/online/dir_section_7.html

The preferred terms (more or less following POSIX) are

"terminating null byte" (and terminating null wide character")
and
"null-terminated string"

I've made a pass through the pages, bringing more consistency.
Ideally, the first instance of "terminating null byte" on most pages
also now includes mention of '\0'.

Take a look through git (or man-pages-3.35 when it comes out).

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
