From: Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org>
Subject: Re: veth.4
Date: Thu, 13 Dec 2012 11:05:34 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1212131100560.7876@hier>
References: <alpine.DEB.2.02.1211021413490.9880@localhost> <CAKgNAkjF-tO4X=REyfA=XG25s-SHfNwkCTmi4vXFbvQPWZZQyQ@mail.gmail.com> <alpine.DEB.2.02.1211032207190.3081@localhost> <87zk2ytdbu.fsf@xmission.com> <5095C848.9000501@parallels.com> <87vcdksn7l.fsf@xmission.com>
 <CAKgNAkiQFFkGq9tXT2n8KeaWuQxqh4HyU5YG6tHB5TYPvkNSVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1654565097-1355393134=:7876"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiQFFkGq9tXT2n8KeaWuQxqh4HyU5YG6tHB5TYPvkNSVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1654565097-1355393134=:7876
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Dec 2012, Michael Kerrisk (man-pages) wrote:

> Do you have a revised version of this page taking into account the
> comments of Eric and Pavel?

No I don't. I got trampled down by a horde of rabid real life tasks and am=
=20
slowly recovering from it. I'll make a new effort at some point, Eric's=20
and Pavel's emails still have their cosy place in my INBOX and are waiting=
=20
to be groomed.

Thanks for pinging me!
*t

> On Mon, Nov 5, 2012 at 5:11 AM, Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>=
 wrote:
>> Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> writes:
>>
>>> On 11/04/2012 04:35 AM, Eric W. Biederman wrote:
>>>> Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org> writes:
>>>>
>>>>> Hi again Michael, Pavel, Eric and mailing list
>>>>>
>>>>> (Cc: to Eric, Pavel and Linux Netdev List on behalf of Michael asking
>>>>> for comment)
>>>>>
>>>>> Here's the revised veth(4) man page (the inline replies to Michael's
>>>>> critique are following the man page):
>>>>>
>>>>> ********************************************************************
>>>>> .\" Copyright (c) 2012 Tom=C3=A1=C5=A1 Posp=C3=AD=C5=A1ek (tpo_deb@so=
urcepole.ch),
>>>>> .\"     Fri, 03 Nov 2012 22:35:33 +0100
>>>>> .\"
>>>>> .\" This is free documentation; you can redistribute it and/or
>>>>> .\" modify it under the terms of the GNU General Public License as
>>>>> .\" published by the Free Software Foundation; either version 2 of
>>>>> .\" the License, or (at your option) any later version.
>>>>> .\"
>>>>> .\" The GNU General Public License's references to "object code"
>>>>> .\" and "executables" are to be interpreted as the output of any
>>>>> .\" document formatting or typesetting system, including
>>>>> .\" intermediate and printed output.
>>>>> .\"
>>>>> .\" This manual is distributed in the hope that it will be useful,
>>>>> .\" but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>> .\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>>> .\" GNU General Public License for more details.
>>>>> .\"
>>>>> .\" You should have received a copy of the GNU General Public
>>>>> .\" License along with this manual; if not, write to the Free
>>>>> .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=
 02111,
>>>>> .\" USA.
>>>>> .\"
>>>>> .\"
>>>>> .TH veth 4 2012-11-02 "Linux" "Linux Programmer's Manual"
>>>>> .SH NAME
>>>>> veth \- Virtual Ethernet Device
>>>>> .SH DESCRIPTION
>>>>> The
>>>>> .B veth
>>>>> devices are virtual Ethernet devices.
>>>>>
>>>>> They can act as tunnels between network namespaces to create
>>>>> a bridge to a physical network device in another namespace, but
>>>>> can also be used as standalone network devices.
>>>>
>>>> As far as understanding and using them I think this text is a bit weak=
=2E
>>>> Perhaps something like:
>>>>
>>>> ip link add type veth creates a pair of directly connected ethernet
>>>> devices.   What is transmited on one device is immediately received on
>>>> the other device.  When either devices is down the link state of the
>>>> pair is down.  veth device pairs are useful for combining the network
>>>> facilities of the kernel together in interesting ways.  A particularly
>>>> interesting use case is to place one end of a veth pair in one network
>>>> namespace and another end of the veth pair in another network namespac=
e
>>>> allowing communication between network namespaces.
>>>
>>> Ack
>>>
>>>> ethtool can be used to test if a networking device is a veth device,
>>>> and to find the peer network interface.
>>>
>>> This one requires clarification, I think. The ethtool will report you
>>> just and ifindex of the peer, and the caller can do something useful
>>> with it if the peer is still in the same net namespace as the original
>>> device. But how would you find the peer device in case it already sits
>>> in some other network namespace?
>>
>> Until just recently the ifindex of networking devices was universally
>> unique so finding the other end of the device could be done with a brute
>> force search through network namespaces.  Even without a guarantee of
>> global uniqueness in the ifindex performing a bidirectional comparison
>> of the return ifindicies of veth devices can give a strong hint that you
>> have found both ends of the tunnel.
>>
>> For checkpoint/restart we may need to implement something better at some=
 point.
>>
>>
>> Eric
>>
>
>
>
> --=20
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Author of "The Linux Programming Interface"; http://man7.org/tlpi/
>
>
--8323329-1654565097-1355393134=:7876--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
