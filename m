From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Missing macro _SC_SYMLOOP_MAX in sysconf(3)
Date: Sun, 15 Apr 2012 22:18:08 +1200
Message-ID: <CAKgNAkhx8CM5wsXx4XHtCFSKR99xZk-=fi9Kx2qfTLxpakq1+Q@mail.gmail.com>
References: <20120326091129.GA4683@viper.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120326091129.GA4683-rZQYlw8LueDDOqzlkpFKJg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Ricardo_Catalinas_Jim=E9nez?= <jimenezrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 26, 2012 at 10:11 PM, Ricardo Catalinas Jim=E9nez
<jimenezrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> =A0In the man-page of sysconf(3), the macro SYMLOOP_MAX is listed but=
 not
> its symmetric _SC_SYMLOOP_MAX. At least in my Linux, in /usr/include
> _SC_SYMLOOP_MAX is defined, so I think this could be a bug.

Thanks Ricardo,

I added this for man-pages-3.39.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
