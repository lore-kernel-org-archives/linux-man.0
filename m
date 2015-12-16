From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add Prefer_MAP_32BIT_EXEC to map executable pages with
 MAP_32BIT
Date: Wed, 16 Dec 2015 15:33:45 +0100
Message-ID: <56717649.6080102@gmail.com>
References: <CAMe9rOo1OBOGruWMoLTx96wnkKUYPzBZ5HcOCFdGJEp+jTRzVA@mail.gmail.com>	 <56716EDC.7020205@gmail.com> <1450275413.1472.215.camel@pbcl.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450275413.1472.215.camel-MHJFCCCcTeg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Blundell <pb-MHJFCCCcTeg@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jeff Law <law-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, Adhemerval Zanella <adhemerval.zanella-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/16/2015 03:16 PM, Phil Blundell wrote:
> On Wed, 2015-12-16 at 15:02 +0100, Michael Kerrisk (man-pages) wrote:
>>
>> NB: MAP_32BIT will map to the low 2GB (not 2GB) of  the  address
>> space.
> 
> Isn't that meant to say "not 4GB"?

Quite! Thanks, Phil.

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
