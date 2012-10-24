From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Request for review] Revised delete_module(2) manual page
Date: Wed, 24 Oct 2012 14:47:43 +0200
Message-ID: <CAKgNAki5NbXWU8i7DtCEqAt=3pG+OtZe9E+Wm3xjJGD-sDbO6Q@mail.gmail.com>
References: <CAKgNAkgp1er3-3nvge9_aVObuuxBatGRur8DtiTzyWK4w+4hrA@mail.gmail.com>
 <87txu17lss.fsf@rustcorp.com.au> <CAKgNAkib2RZaHWP9bM0hC62=Nm5sBisQf_D9BAKNomjEPvCWbA@mail.gmail.com>
 <CAKgNAkghLrh61FvxcuQ3xKfX7=o-PhV390RN+9Ni+3fgJzMFJA@mail.gmail.com> <CAKi4VA+tW30=8c18kNXVrw+v2x9=kQEYoF7Yjck6C98wHpNs0A@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKi4VA+tW30=8c18kNXVrw+v2x9=kQEYoF7Yjck6C98wHpNs0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas De Marchi <lucas.de.marchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Lucas,

On Wed, Oct 24, 2012 at 7:27 AM, Lucas De Marchi
<lucas.de.marchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Michael,
>
>
> On Sun, Oct 21, 2012 at 5:36 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Ping!
>>
>> Rusty (et al.) I'm pretty sure the new page text is okay, but I would
>> like someone knowledgeable to confirm.
>
> One more thing:
>
>> .SH "SEE ALSO"
>> .BR create_module (2),
>> .BR init_module (2),
>> .BR query_module (2),
>> .BR lsmod (8),
>> .BR rmmod (8)
>
> Shouldn't we remove the reference to query_module(2) and
> create_module(2)? They don't exist anymore (and I miss a bigger
> warning on their man pages).

I think the SEE ALSO links should be kept, but you are right that the
warnings that query_module(2) and create_module(2) no longer exist
should be more prominent on those pages. By chance, I'd already made
that change.

> Last, I think there should be a ref here to modprobe (because of -r
> flag), not lsmod. The rest looks good.

I'll add modprobe(8); I think lsmod(8) is worth keeping.

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
