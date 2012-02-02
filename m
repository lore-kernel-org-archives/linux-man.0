From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in scanf
Date: Fri, 3 Feb 2012 08:04:28 +1300
Message-ID: <CAKgNAkiXjb-Q9mysbHKqGpxAhGPAYyJfe3JtP6AACLU7ARw06A@mail.gmail.com>
References: <4EC609E9.80707@free.fr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4EC609E9.80707-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alain <alainb06-GANU6spQydw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Nov 18, 2011 at 8:31 PM, Alain <alainb06-GANU6spQydw@public.gmane.org> wrote:
> There is a typo in the example given under "Note" section.
>
> Sorry I saw just now that there is a very easy way to report that by mail...
> I already files the report (and details such as version used = Ubuntu
> 10.04.3) here :
>
> https://bugs.launchpad.net/ubuntu/+source/man-db/+bug/891854
>
> Typo is:
>
> fprintf(stderr, "No matching characters\n"):
>
> Should be instead
>
> fprintf(stderr, "No matching characters\n");
>
>
> ( ';' semicolon terminates an C instruction, and not ':' colon )
>
> I also made a suggestion (see bug report), to change the example using the
> 'm' modifier as 'a' seems rather dangerous and obsolete.
> This second part is just a suggestion (subject to discussion) whereas the
> typo is really there and makes compiling without errors impossible.
>
> Best regards.
> Alain BENEDETTI

Thanks Alain. Fixed!

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
