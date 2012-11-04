From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: veth.4
Date: Sat, 03 Nov 2012 17:35:17 -0700
Message-ID: <87zk2ytdbu.fsf@xmission.com>
References: <alpine.DEB.2.02.1211021413490.9880@localhost>
	<CAKgNAkjF-tO4X=REyfA=XG25s-SHfNwkCTmi4vXFbvQPWZZQyQ@mail.gmail.com>
	<alpine.DEB.2.02.1211032207190.3081@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1211032207190.3081@localhost> (Tomas Pospisek's
	message of "Sat, 3 Nov 2012 22:35:15 +0100 (CET)")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pavel Emelianov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org> writes:

> Hi again Michael, Pavel, Eric and mailing list
>
> (Cc: to Eric, Pavel and Linux Netdev List on behalf of Michael asking
> for comment)
>
> Here's the revised veth(4) man page (the inline replies to Michael's
> critique are following the man page):
>
> ********************************************************************
> .\" Copyright (c) 2012 Tom=C3=A1=C5=A1 Posp=C3=AD=C5=A1ek (tpo_deb@so=
urcepole.ch),
> .\"     Fri, 03 Nov 2012 22:35:33 +0100
> .\"
> .\" This is free documentation; you can redistribute it and/or
> .\" modify it under the terms of the GNU General Public License as
> .\" published by the Free Software Foundation; either version 2 of
> .\" the License, or (at your option) any later version.
> .\"
> .\" The GNU General Public License's references to "object code"
> .\" and "executables" are to be interpreted as the output of any
> .\" document formatting or typesetting system, including
> .\" intermediate and printed output.
> .\"
> .\" This manual is distributed in the hope that it will be useful,
> .\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> .\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> .\" GNU General Public License for more details.
> .\"
> .\" You should have received a copy of the GNU General Public
> .\" License along with this manual; if not, write to the Free
> .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA=
 02111,
> .\" USA.
> .\"
> .\"
> .TH veth 4 2012-11-02 "Linux" "Linux Programmer's Manual"
> .SH NAME
> veth \- Virtual Ethernet Device
> .SH DESCRIPTION
> The
> .B veth
> devices are virtual Ethernet devices.
>
> They can act as tunnels between network namespaces to create
> a bridge to a physical network device in another namespace, but
> can also be used as standalone network devices.

As far as understanding and using them I think this text is a bit weak.
Perhaps something like:

ip link add type veth creates a pair of directly connected ethernet
devices.   What is transmited on one device is immediately received on
the other device.  When either devices is down the link state of the
pair is down.  veth device pairs are useful for combining the network
facilities of the kernel together in interesting ways.  A particularly
interesting use case is to place one end of a veth pair in one network
namespace and another end of the veth pair in another network namespace
allowing communication between network namespaces.

ethtool can be used to test if a networking device is a veth device,
and to find the peer network interface.

Eric

>
> Because of their original purpose for tunneling
> .B veth
> devices are always created in pairs, that are
> interconnected with each other.
> When one
> .B veth
> end receives a packet it appears on its pair and vice versa.
>
> .B Veth
> devices can be manipulated with the
> .BR ip (8)
> tool.
> See
> .I "ip link help"
> for more information.
>
> .SH NOTES
> This page is based on Pavel Emelianov's veth driver submission to
> the LKML and on the .BR clone (8)
> manpage.
>
> .SH "SEE ALSO"
> .BR clone (2),
> .BR ip (8)
> ********************************************************************
>
> On Sat, 3 Nov 2012, Michael Kerrisk (man-pages) wrote:
>
>> On Fri, Nov 2, 2012 at 2:25 PM, Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org> w=
rote:
> [...]
>>> You can find the manpage below
>>
>> See comments. After revising, could you resubmit, and and Eric
>> Biederman and Pavel Emelianov to CC, asking them for comment. Maybe
>> also CC linux-kernel.
>>
>> Also, do you have a pointer to "Pavel Emelianov's veth driver
>> submission to the LKML"? I couldn't find it. It would be at least
>> handy to have a URL for archived mail in the changelog for this man
>> page.
>
> Apparently that was to the Linux Netdev List. So I've Cc'ed it instea=
d
> of LKML.
>
> http://lwn.net/Articles/237688/
> http://lwn.net/Articles/241883/
>
>>> .TH veth 4 2012-11-02 "Linux" "Linux Programmer's Manual"
>>> .SH NAME
>>> veth \- Virtual Ethernet Device
>>> .SH DESCRIPTION
>>> The \fBveth*\fP devices are virtual ethernet devices.
>>
>> Ethernet
>>
>>> They can act as tunnels between network namespaces to create
>>> a bridge to a physical network device in another namespace, but
>>> can also be used as standalone network devices.
>>>
>>> Because of their original purpose for tunneling \fBveth\fP devices
>>
>> I somewhat prefer the use of the line formatting directives, thus
>>
>> .B veth
>>
>>> are allways created in pairs, that are interconnected with
>>
>> always
>>
>>> each other.  When one \fBveth\fP end receives a packet it
>>
>> I prefer new sentences to start on new source lines (See man-pages(7=
).)
>>
>>> appears on its pair and vice versa.
>>>
>>> \fBVeth\fP devices can be manipulated with the
>>> .BR ip (8)
>>> tool. See \fB ip link help\fP for more information.
>>
>> See
>> .I "ip link help"
>> for more information.
>>
>>> .SH "SEE ALSO"
>>> .BR ip (8) ,
>>> .BR clone (2)
>>
>> Reverse the order of those two lines.
>>
>>> .SH COLOPHON
>>
>> The COLOPHON is autogenerated by scripts. No need to add it, [...]
>
> The above manpage should have incorporated all your critique to this
> point.
>
>> [...] and we
>> don't really need the next sentence in the man-page itself, thought =
it
>> will be useful for the changelog.
>>
>>> This page is based on Pavel Emelianov's veth driver submission to
>>> the LKML and on the .BR clone (8)
>>> manpage.
>
> The reason I've included this - and I've moved it to the "NOTES"
> section above - is that I feel extremely uncomfortable evoking the
> impression the man page would be my work. I don't want to deny
> responsability for what I've submitted to the mailing list - the
> faults are of course mine. But 99% of the sentences from the veth(4)
> manpage are copy/paste from Pavel's email or the clone man page.
>
> Certainly I won't insist on the NOTES section and rip it out or move
> it to the comments on your request.
>
> Thanks a lot for your consideration of the manpage submission,
> *t
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
