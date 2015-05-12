From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Some locale related updates
Date: Tue, 12 May 2015 16:23:28 +0200
Message-ID: <55520CE0.8080302@gmail.com>
References: <555206C7.8000308@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555206C7.8000308-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Marko,

On 05/12/2015 03:57 PM, Marko Myllynen wrote:
> Hi Michael,
> 
> I'll send some locale related updates shortly, most of them should be
> pretty self-explanatory but I'll provide some references in few cases
> and I'm sure you can come up with slightly better wording here and there.

I've applied all of the following:

    locale.5: document class in LC_CTYPE
    locale.5: document default_missing
    locale.5: document character transliteration
    locale.5: document map "totitle"
    locale.5: copy is not exclusive in LC_CTYPE and LC_COLLATE
    locale.5: document map to_inpunct, map to_outpunct
    locale.5: document outdigit and alt_digits
    locale.5: document charclass and charconv
    locale.7: LC_CTYPE determines transliteration rules on glibc systems

and also this one that you just sent

    locale.5: fix country_isbn format

Are there more to come?

> Related to wording, I see that setlocale(3) states:
> 
> The locale "C" or "POSIX" is a portable locale; its LC_CTYPE part
> corresponds to the 7-bit ASCII character set.
> 
> And
> http://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap07.html#tag_07_02
> states:
> 
> The tables in Locale Definition describe the characteristics and
> behavior of the POSIX locale for data consisting entirely of characters
> from the portable character set and the control character set. For other
> characters, the behavior is unspecified.
> 
> Do you think setlocale(3) is consistent with the above?

Help me here ;-). Do you see a problem? If yes, what is it?

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
