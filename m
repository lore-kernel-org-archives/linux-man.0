From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: IP_MULTICAST_IF getsockopt man part
Date: Sat, 5 May 2012 23:57:35 +1200
Message-ID: <CAKgNAkgBz_dRV97JVV1Np0YuEd0EVqoLPZkajiE_KJ2Lk20YRA@mail.gmail.com>
References: <20120504090013.GA2362@minipsycho>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20120504090013.GA2362@minipsycho>
Sender: netdev-owner@vger.kernel.org
To: Jiri Pirko <jpirko@redhat.com>
Cc: linux-man@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Fri, May 4, 2012 at 9:00 PM, Jiri Pirko <jpirko@redhat.com> wrote:
> Hi.
>
> <quote>
> IP_MULTICAST_IF (since Linux 1.2)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Set the local device for a=
 multicast socket.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Argument is an ip_mreqn or=
 ip_mreq structure
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0similar to IP_ADD_MEMBERSH=
IP.
> </quote>
>
> That is not true. Setsockopt recognizes only ip_mreqn and in_addr. I
> made patch which makes it recognize ip_mreq as well. So that would be
> probably ok.
> http://patchwork.ozlabs.org/patch/156815/
>
> On the other hand, getsockopt works only with in_addr. That I think i=
s
> good behaviour but manpages here needs to be corrected in this way (r=
ead
> part needs to be added here)

Jirka,

I'm having trouble to understand what you mean. Perhaps it would be
simplest if you showed your proposed replacement text for the text
quoted above.

Thanks,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
