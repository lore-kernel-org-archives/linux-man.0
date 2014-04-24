From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages bug- syslog(3) grammar
Date: Thu, 24 Apr 2014 19:03:37 +0200
Message-ID: <CAKgNAkjGzM-P3Ce1TnBKn0r9xr1W4bjS+S9zCub2=gioWFVQ8w@mail.gmail.com>
References: <5357AF43.8080102@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5357AF43.8080102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Naydenov <gnaydenov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Georgi!

On Wed, Apr 23, 2014 at 2:17 PM, Georgi Naydenov <gnaydenov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Michael,
> I guess that's your email here. First, thank you for your excellent book!
> (We met at the OpenFest in Sofia, Bulgaria a few years ago and luckily you
> had some copies with you. :)

Yes, I remember.

> About the pages - nothing special but what do you think about the commas
> when describing notice message priorty here:
> http://man7.org/linux/man-pages/man3/syslog.3.html
> and also in syslog(3) at least on Fedora, CentOS6 and RHEL6/7beta.
>
>        LOG_NOTICE     normal, but significant, condition
>
> Shouldn't be "significant condition"? For example, as specified in RFC5424
> (http://tools.ietf.org/html/rfc5424):
>
>                       ....
>               5       Notice: normal but significant condition
>               6       Informational: informational messages
>               7       Debug: debug-level messages
>
>               Table 2. Syslog Message Severities

Either form works, so I'll leave as is.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
