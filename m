From: Jim Belton <jim.belton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Date: Sat, 14 Aug 2010 14:36:05 -0700
Message-ID: <AANLkTi=5BWwoACrxGXL49KSu1YCpPa48Y5PmzYXUHQXE@mail.gmail.com>
References: <AANLkTinr-kk0AeDK9JPXe5MBdGanC2MJ69ixoLeMptKK@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTinr-kk0AeDK9JPXe5MBdGanC2MJ69ixoLeMptKK-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi again:

I just moved an include line and discovered that _GNU_SOURCE must be
defined before almost any include, or it won't work. This is because
almost every other include file includes <features.h>. It's probably
best to document it as "should be defined before any include
directives". <features.h> does not require explicit inclusion, since
<sys/socket.h> includes <features.h> (my test code was naughtily
including <bits/socket.h>).

Thanks again,
Jim.

On Sat, Aug 14, 2010 at 12:32 PM, Jim Belton <jim.belton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> Hi:
>
> I've found a few minor improvements could be made to the tcp(7) and
> unix(7) manual pages:
> =A01. <linux/sockios.h> needs to be included to get the definitions o=
f
> the SIOC ioctls documented in tcp(7), but it is not listed as a
> required include file on that page.
> =A02. The SIOCINQ ioctl applies to unix domain sockets as well as tcp
> sockets, but this is not documented on the unix(7) page. I have teste=
d
> that this works. I would guess that the other SIOC ioctls also work o=
n
> unix domains sockets.
> =A03. The ucred structure is hidden by default in the latest versions=
 of
> the header files, but is not revealed (as documented on the unix(7)
> page) by defining _GNU_SOURCE, but by defining __USE_GNU. Also, this
> definition must be made before the first inclusion of any file that
> include <sys/socket.h>, which is most of the networking header files.
> Finally, you can define __USE_GNU by defining _GNU_SOURCE, but to do
> that, you must include <features.h> between the definition of
> _GNU_SOURCE and the inclusion of the first file that includes
> <sys/sockets.h>
>
> I'm not sure whether the glibc header maintainers would be OK with
> docs talking about __USE_GNU. This may be an internal implementation
> detail that they prefer to keep changeable.
>
> Being a UNIX old timer, I know my way around nroff and man pages. If
> you don't have the time, I can make these changes to the man source.
> Please let me know if you need me to do this.
>
> Thanks for keeping the docs up to date! Developers really appreciate
> them. Having used MSDN, I can safely say that the Linux and FreeBSD
> manuals are still far better.
>
> Best regards,
> Jim
>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
