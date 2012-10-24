From: Lucas De Marchi <lucas.de.marchi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Request for review] Revised delete_module(2) manual page
Date: Wed, 24 Oct 2012 03:27:11 -0200
Message-ID: <CAKi4VA+tW30=8c18kNXVrw+v2x9=kQEYoF7Yjck6C98wHpNs0A@mail.gmail.com>
References: <CAKgNAkgp1er3-3nvge9_aVObuuxBatGRur8DtiTzyWK4w+4hrA@mail.gmail.com>
 <87txu17lss.fsf@rustcorp.com.au> <CAKgNAkib2RZaHWP9bM0hC62=Nm5sBisQf_D9BAKNomjEPvCWbA@mail.gmail.com>
 <CAKgNAkghLrh61FvxcuQ3xKfX7=o-PhV390RN+9Ni+3fgJzMFJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkghLrh61FvxcuQ3xKfX7=o-PhV390RN+9Ni+3fgJzMFJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lucas De Marchi <lucas.demarchi-Y3ZbgMPKUGA34EUeqzHoZw@public.gmane.org>, Jon Masters <jonathan-Zp4isUonpHBD60Wz+7aTrA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,


On Sun, Oct 21, 2012 at 5:36 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Ping!
>
> Rusty (et al.) I'm pretty sure the new page text is okay, but I would
> like someone knowledgeable to confirm.

One more thing:

> .SH "SEE ALSO"
> .BR create_module (2),
> .BR init_module (2),
> .BR query_module (2),
> .BR lsmod (8),
> .BR rmmod (8)

Shouldn't we remove the reference to query_module(2) and
create_module(2)? They don't exist anymore (and I miss a bigger
warning on their man pages).

Last, I think there should be a ref here to modprobe (because of -r
flag), not lsmod. The rest looks good.


Lucas De Marchi
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
