From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Problem in manpage of uname(2)
Date: Sat, 2 May 2009 16:41:38 +1200
Message-ID: <cfd18e0f0905012141jc19f906v35990818f6adca29@mail.gmail.com>
References: <200904281323.23357.bartoschek@or.uni-bonn.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200904281323.23357.bartoschek-eefaeeawk+jFLWzOrOlZPg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Bartoschek <bartoschek-eefaeeawk+jFLWzOrOlZPg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christian Panten <panten-eefaeeawk+jFLWzOrOlZPg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Christoph,

On Tue, Apr 28, 2009 at 11:21 PM, Christoph Bartoschek
<bartoschek-eefaeeawk+jFLWzOrOlZPg@public.gmane.org> wrote:
> Hi,
>
> I am using opensuse 11.1 with the most recent updates. The problem ca=
n also be
> found on the page
> http://www.kernel.org/doc/man-pages/online/pages/man2/uname.2.html
>
> The page states that the member domainname of struct utsname is only =
available
> if _GNU_SOURCE is defined.
>
> However in /usr/include/sys/utsname.h I can only find:
>
> #if _UTSNAME_DOMAIN_LENGTH - 0
> =A0 =A0/* Name of the domain of this node on the network. =A0*/
> # ifdef __USE_GNU
> =A0 =A0char domainname[_UTSNAME_DOMAIN_LENGTH];
> # else
> =A0 =A0char __domainname[_UTSNAME_DOMAIN_LENGTH];
> # endif
>
> and in /usr/include/bits/utsname.h:
>
> /* Length of the entries in `struct utsname' is 65. =A0*/
> #define _UTSNAME_LENGTH 65
>
> /* Linux provides as additional information in the `struct utsname'
> =A0 the name of the current domain. =A0Define _UTSNAME_DOMAIN_LENGTH
> =A0 to a value !=3D 0 to activate this entry. =A0*/
> #define _UTSNAME_DOMAIN_LENGTH _UTSNAME_LENGTH
>
>
>
> This means that for linux the struct utname has always six members an=
d the
> last one is either named domainname or __domainname.

All of what you say above is correct, but:

> The manpage should state
> this to make clear that a struct utsname has to be initialized like t=
his:
>
> struct utsname name =3D {"", "", "", "", "", ""};

Since we only get a utsname structure back from the kernel, I'm not
sure why we would need to care about initializing it as shown here.
Can you say some more please.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
