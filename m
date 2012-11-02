From: Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org>
Subject: veth.4
Date: Fri, 2 Nov 2012 14:25:43 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1211021413490.9880@localhost>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1045718433-1351862743=:9880"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1045718433-1351862743=:9880
Content-Type: TEXT/PLAIN; format=flowed; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hello linux-man ML and Michael,

below you'll find a manpage about the veth virtual ethernet device. The=20
manpage is a summarisation of the sparse information about veth I found on=
=20
the net.

I'd be glad if veth(4) could find a place in the manpages because=20
allthough I was using veth's a lot lately, I had no idea about how they=20
work and so didn't my peers. So I suspect a manpage might be useful.

In my ignorance I've chosen section 4 for the manpage, maybe there's a=20
better one.

You can find the manpage below

Thanks,
*t

***************************************************************
=2E\" Copyright (c) 2012 Tom=E1=A8 Posp=ED=A8ek (tpo_deb-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org),
=2E\"     Fri, 02 Nov 2012 13:37:33 +0100
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
The \fBveth*\fP devices are virtual ethernet devices.

They can act as tunnels between network namespaces to create
a bridge to a physical network device in another namespace, but
can also be used as standalone network devices.

Because of their original purpose for tunneling \fBveth\fP devices
are allways created in pairs, that are interconnected with
each other.  When one \fBveth\fP end receives a packet it
appears on its pair and vice versa.

\fBVeth\fP devices can be manipulated with the
=2EBR ip (8)
tool. See \fB ip link help\fP for more information.

=2ESH "SEE ALSO"
=2EBR ip (8) ,
=2EBR clone (2)

=2ESH COLOPHON
This page is based on Pavel Emelianov's veth driver submission to
the LKML and on the=20
=2EBR clone (8)
manpage.

It is part of release 3.44 of the Linux
=2EI man-pages
project.
A description of the project,
and information about reporting bugs,
can be found at
http://man7.org/linux/man-pages/.
***************************************************************

--8323328-1045718433-1351862743=:9880--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
