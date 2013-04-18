From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Small typo in the getaddrinfo(3) man page
Date: Thu, 18 Apr 2013 10:03:44 +0200
Message-ID: <CAKgNAki2D_syOngCDdSkuqFeZQq-y2rrz-6km8=BjOyGsi2kig@mail.gmail.com>
References: <CADZuF1kVtzSzTZmPJp78XvDyrtoBgzsKG7b=BEFsKO_pcNsv5Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADZuF1kVtzSzTZmPJp78XvDyrtoBgzsKG7b=BEFsKO_pcNsv5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Damien Grassart <damien-Uo5SsgSf8ZRWk0Htik3J/w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Apr 18, 2013 at 1:22 AM, Damien Grassart <damien-Uo5SsgSf8ZRWk0Htik3J/w@public.gmane.org> wrote:
> Hi, I believe this part of getaddrinfo(3):
>
> "If hint.ai_flags specifies the  AI_V4MAPPED flag"
>
> should read:
>
> "If hints.ai_flags specifies the AI_V4MAPPED flag"
>
>
> i.e. the 's' is missing from "hints".

Thanks, Damien. Fixed now.

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
