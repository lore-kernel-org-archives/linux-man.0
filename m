From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: veth.4
Date: Sun, 04 Nov 2012 20:11:42 -0800
Message-ID: <87vcdksn7l.fsf@xmission.com>
References: <alpine.DEB.2.02.1211021413490.9880@localhost>
	<CAKgNAkjF-tO4X=REyfA=XG25s-SHfNwkCTmi4vXFbvQPWZZQyQ@mail.gmail.com>
	<alpine.DEB.2.02.1211032207190.3081@localhost>
	<87zk2ytdbu.fsf@xmission.com> <5095C848.9000501@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5095C848.9000501-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> (Pavel Emelyanov's message of
	"Sun, 04 Nov 2012 05:43:36 +0400")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Cc: Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> writes:

> On 11/04/2012 04:35 AM, Eric W. Biederman wrote:
>> Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org> writes:
>>=20
>>> Hi again Michael, Pavel, Eric and mailing list
>>>
>>> (Cc: to Eric, Pavel and Linux Netdev List on behalf of Michael aski=
ng
>>> for comment)
>>>
>>> Here's the revised veth(4) man page (the inline replies to Michael'=
s
>>> critique are following the man page):
>>>
>>> *******************************************************************=
*
>>> .\" Copyright (c) 2012 Tom=C3=A1=C5=A1 Posp=C3=AD=C5=A1ek (tpo_deb@=
sourcepole.ch),
>>> .\"     Fri, 03 Nov 2012 22:35:33 +0100
>>> .\"
>>> .\" This is free documentation; you can redistribute it and/or
>>> .\" modify it under the terms of the GNU General Public License as
>>> .\" published by the Free Software Foundation; either version 2 of
>>> .\" the License, or (at your option) any later version.
>>> .\"
>>> .\" The GNU General Public License's references to "object code"
>>> .\" and "executables" are to be interpreted as the output of any
>>> .\" document formatting or typesetting system, including
>>> .\" intermediate and printed output.
>>> .\"
>>> .\" This manual is distributed in the hope that it will be useful,
>>> .\" but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> .\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> .\" GNU General Public License for more details.
>>> .\"
>>> .\" You should have received a copy of the GNU General Public
>>> .\" License along with this manual; if not, write to the Free
>>> .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, =
MA 02111,
>>> .\" USA.
>>> .\"
>>> .\"
>>> .TH veth 4 2012-11-02 "Linux" "Linux Programmer's Manual"
>>> .SH NAME
>>> veth \- Virtual Ethernet Device
>>> .SH DESCRIPTION
>>> The
>>> .B veth
>>> devices are virtual Ethernet devices.
>>>
>>> They can act as tunnels between network namespaces to create
>>> a bridge to a physical network device in another namespace, but
>>> can also be used as standalone network devices.
>>=20
>> As far as understanding and using them I think this text is a bit we=
ak.
>> Perhaps something like:
>>=20
>> ip link add type veth creates a pair of directly connected ethernet
>> devices.   What is transmited on one device is immediately received =
on
>> the other device.  When either devices is down the link state of the
>> pair is down.  veth device pairs are useful for combining the networ=
k
>> facilities of the kernel together in interesting ways.  A particular=
ly
>> interesting use case is to place one end of a veth pair in one netwo=
rk
>> namespace and another end of the veth pair in another network namesp=
ace
>> allowing communication between network namespaces.
>
> Ack
>
>> ethtool can be used to test if a networking device is a veth device,
>> and to find the peer network interface.
>
> This one requires clarification, I think. The ethtool will report you=
=20
> just and ifindex of the peer, and the caller can do something useful=20
> with it if the peer is still in the same net namespace as the origina=
l=20
> device. But how would you find the peer device in case it already sit=
s=20
> in some other network namespace?

Until just recently the ifindex of networking devices was universally
unique so finding the other end of the device could be done with a brut=
e
force search through network namespaces.  Even without a guarantee of
global uniqueness in the ifindex performing a bidirectional comparison
of the return ifindicies of veth devices can give a strong hint that yo=
u
have found both ends of the tunnel.

=46or checkpoint/restart we may need to implement something better at s=
ome point.


Eric

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
