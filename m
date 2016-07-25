From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: bug in MAN page for data command
Date: Mon, 25 Jul 2016 20:13:11 +0200
Message-ID: <CAKgNAkjwBaEJJU6s-hhPp1w8yRN6_wND1TDkfeVK5M0y4Q1ayA@mail.gmail.com>
References: <EAA6368FF9FFEC4A9FBC37D3F3C13A93010F4D90@prod-mail.logos.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <EAA6368FF9FFEC4A9FBC37D3F3C13A93010F4D90-HSqCb42VIZNmQe14T31eh42P0GrZ+RbP@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars Issing Sauer <lsa-ZaLajylon1w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Casper_Thor=C3=B8_Vium_Pedersen?= <CTP-ZaLajylon1w@public.gmane.org>, Jeppe Andreasen <JEA-ZaLajylon1w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Lars

On 25 July 2016 at 17:21, Lars Issing Sauer <lsa-ZaLajylon1w@public.gmane.org> wrote:
> Hi,
>
> I found that the MAN for "date" has wrong representation of "month" and "minutes".
>
> Command: date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]
>
> According to the description "%M" is minutes and "%m" is month... but the command takes "%M" as month and "%m" as minutes ;)
>
> http://man7.org/linux/man-pages/man1/date.1.html

This manual page is maintained by another project. See the following
link for info about how to report bugs for that project:

http://man7.org/linux/man-pages/man1/date.1.html#COLOPHON

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
