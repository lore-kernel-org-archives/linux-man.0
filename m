From: Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org>
Subject: Re: veth.4
Date: Sat, 3 Nov 2012 22:35:15 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1211032207190.3081@localhost>
References: <alpine.DEB.2.02.1211021413490.9880@localhost> <CAKgNAkjF-tO4X=REyfA=XG25s-SHfNwkCTmi4vXFbvQPWZZQyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-763794942-1351978515=:3081"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjF-tO4X=REyfA=XG25s-SHfNwkCTmi4vXFbvQPWZZQyQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pavel Emelianov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-763794942-1351978515=:3081
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi again Michael, Pavel, Eric and mailing list

(Cc: to Eric, Pavel and Linux Netdev List on behalf of Michael asking for=
=20
comment)

Here's the revised veth(4) man page (the inline replies to Michael's=20
critique are following the man page):

********************************************************************
=2E\" Copyright (c) 2012 Tom=C3=A1=C5=A1 Posp=C3=AD=C5=A1ek (tpo_deb@source=
pole.ch),
=2E\"     Fri, 03 Nov 2012 22:35:33 +0100
=2E\"
=2E\" This is free documentation; you can redistribute it and/or
=2E\" modify it under the terms of the GNU General Public License as
=2E\" published by the Free Software Foundation; either version 2 of
=2E\" the License, or (at your option) any later version.
=2E\"
=2E\" The GNU General Public License's references to "object code"
=2E\" and "executables" are to be interpreted as the output of any
=2E\" document formatting or typesetting system, including
=2E\" intermediate and printed output.
=2E\"
=2E\" This manual is distributed in the hope that it will be useful,
=2E\" but WITHOUT ANY WARRANTY; without even the implied warranty of
=2E\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
=2E\" GNU General Public License for more details.
=2E\"
=2E\" You should have received a copy of the GNU General Public
=2E\" License along with this manual; if not, write to the Free
=2E\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 021=
11,
=2E\" USA.
=2E\"
=2E\"
=2ETH veth 4 2012-11-02 "Linux" "Linux Programmer's Manual"
=2ESH NAME
veth \- Virtual Ethernet Device
=2ESH DESCRIPTION
The
=2EB veth
devices are virtual Ethernet devices.

They can act as tunnels between network namespaces to create
a bridge to a physical network device in another namespace, but
can also be used as standalone network devices.

Because of their original purpose for tunneling
=2EB veth
devices are always created in pairs, that are
interconnected with each other.
When one
=2EB veth
end receives a packet it appears on its pair and vice versa.

=2EB Veth
devices can be manipulated with the
=2EBR ip (8)
tool.
See
=2EI "ip link help"
for more information.

=2ESH NOTES
This page is based on Pavel Emelianov's veth driver submission to
the LKML and on the=20
=2EBR clone (8)
manpage.

=2ESH "SEE ALSO"
=2EBR clone (2),
=2EBR ip (8)
********************************************************************

On Sat, 3 Nov 2012, Michael Kerrisk (man-pages) wrote:

> On Fri, Nov 2, 2012 at 2:25 PM, Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org> wrote:
[...]
>> You can find the manpage below
>
> See comments. After revising, could you resubmit, and and Eric
> Biederman and Pavel Emelianov to CC, asking them for comment. Maybe
> also CC linux-kernel.
>
> Also, do you have a pointer to "Pavel Emelianov's veth driver
> submission to the LKML"? I couldn't find it. It would be at least
> handy to have a URL for archived mail in the changelog for this man
> page.

Apparently that was to the Linux Netdev List. So I've Cc'ed it instead of=
=20
LKML.

http://lwn.net/Articles/237688/
http://lwn.net/Articles/241883/

>> .TH veth 4 2012-11-02 "Linux" "Linux Programmer's Manual"
>> .SH NAME
>> veth \- Virtual Ethernet Device
>> .SH DESCRIPTION
>> The \fBveth*\fP devices are virtual ethernet devices.
>
> Ethernet
>
>> They can act as tunnels between network namespaces to create
>> a bridge to a physical network device in another namespace, but
>> can also be used as standalone network devices.
>>
>> Because of their original purpose for tunneling \fBveth\fP devices
>
> I somewhat prefer the use of the line formatting directives, thus
>
> .B veth
>
>> are allways created in pairs, that are interconnected with
>
> always
>
>> each other.  When one \fBveth\fP end receives a packet it
>
> I prefer new sentences to start on new source lines (See man-pages(7).)
>
>> appears on its pair and vice versa.
>>
>> \fBVeth\fP devices can be manipulated with the
>> .BR ip (8)
>> tool. See \fB ip link help\fP for more information.
>
> See
> .I "ip link help"
> for more information.
>
>> .SH "SEE ALSO"
>> .BR ip (8) ,
>> .BR clone (2)
>
> Reverse the order of those two lines.
>
>> .SH COLOPHON
>
> The COLOPHON is autogenerated by scripts. No need to add it, [...]

The above manpage should have incorporated all your critique to this=20
point.

> [...] and we
> don't really need the next sentence in the man-page itself, thought it
> will be useful for the changelog.
>
>> This page is based on Pavel Emelianov's veth driver submission to
>> the LKML and on the .BR clone (8)
>> manpage.

The reason I've included this - and I've moved it to the "NOTES" section=20
above - is that I feel extremely uncomfortable evoking the impression the=
=20
man page would be my work. I don't want to deny responsability for what=20
I've submitted to the mailing list - the faults are of course mine. But=20
99% of the sentences from the veth(4) manpage are copy/paste from Pavel's=
=20
email or the clone man page.

Certainly I won't insist on the NOTES section and rip it out or move it=20
to the comments on your request.

Thanks a lot for your consideration of the manpage submission,
*t
--8323328-763794942-1351978515=:3081--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
