From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Patch for netdevice.7
Date: Mon, 23 Apr 2012 08:31:47 +1200
Message-ID: <CAKgNAkgJvRQowdLatOrdsu2t68zU8KHrKw6RyvLJ0Kbdt2QWwA@mail.gmail.com>
References: <20111102082712.GA30846@openss7.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111102082712.GA30846-B8ReZeU34LJAfugRpC6u6w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bidulock-B8ReZeU34LJAfugRpC6u6w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Brian,

On Wed, Nov 2, 2011 at 9:27 PM, Brian F. G. Bidulock
<bidulock-B8ReZeU34LJAfugRpC6u6w@public.gmane.org> wrote:
> This patch adds common but missing SIOC configuration ioctls to
> the netdevice.7 manual pages that are not documented anywhere
> else. =A0SIOCSIFPFLAGS and SIOCGIFPFLAGS are linux-specific. =A0Flag
> values come from Linux 2.6.25 kernel headers for sockios. =A0The
> others are standard BSD ioctls that have alwasy been implemented
> by Linux and were verified from inspecting netdevice.c kernel code.
>
> Patch follows (and attached):

Thanks! Applied for 3.40.

Cheers,

Michael


> --- netdevice.7.orig =A0 =A02011-11-02 01:34:18.000000000 -0600
> +++ netdevice.7 2011-11-02 02:09:08.000000000 -0600
> @@ -9,7 +9,10 @@
> =A0.\"
> =A0.\" Modified, 2004-11-25, mtk, formatting and a few wording fixes
> =A0.\"
> -.TH NETDEVICE =A07 2009-01-14 "Linux" "Linux Programmer's Manual"
> +.\" Modified, 2011-11-02, <bidulock-B8ReZeU34LJAfugRpC6u6w@public.gmane.org>, added many basic
> +.\" =A0but missing ioctls, such as SIOCGIFADDR.
> +.\"
> +.TH NETDEVICE =A07 2011-11-02 "Linux" "Linux Programmer's Manual"
> =A0.SH NAME
> =A0netdevice \- Low level access to Linux network devices
> =A0.SH SYNOPSIS
> @@ -120,6 +123,59 @@
> =A0Setting the active flag word is a privileged operation, but any
> =A0process may read it.
> =A0.TP
> +.BR SIOCGIFPFLAGS ", " SIOCSIFPFLAGS
> +Get or set extended (private) flags for the device.
> +.I ifr_flags
> +contains a bit mask of the following values:
> +.TS
> +tab(:);
> +c s
> +l l.
> +Private flags
> +IFF_802_1Q_VLAN:Interface is 802.1Q VLAN device.
> +IFF_EBRIDGE:Interface is Ethernet bridging device.
> +IFF_SLAVE_INACTIVE:Interface is inactive bonding slave.
> +IFF_MASTER_8023AD:Interface is 802.3ad bonding master.
> +IFF_MASTER_ALB:Interface is balanced-alb bonding master.
> +IFF_BONDING:Interface is a bonding master or slave.
> +IFF_SLAVE_NEEDARP:Interface needs ARPs for validation.
> +IFF_ISATAP:Interface is RFC4214 ISATAP interface.
> +.TE
> +.sp
> +Setting the extended (private) interface flags is a privileged opera=
tion.
> +.TP
> +.BR SIOCGIFADDR ", " SIOCSIFADDR
> +Get or set the address of the device using
> +.IR ifr_addr .
> +Setting the interface address is a privileged operation.
> +For compatibility, only
> +.B AF_INET
> +addresses are accepted or returned.
> +.TP
> +.BR SIOCGIFDSTADDR ", " SIOCSIFDSTADDR
> +Get or set the destination address of a point-to-point device using
> +.IR ifr_dstaddr .
> +For compatibility, only
> +.B AF_INET
> +addresses are accepted or returned.
> +Setting the destination address is a privileged operation.
> +.TP
> +.BR SIOCGIFBRDADDR ", " SIOCSIFBRDADDR
> +Get or set the broadcast address for a device using
> +.IR ifr_brdaddr .
> +For compatibility, only
> +.B AF_INET
> +addresses are accepted or returned.
> +Setting the broadcast address is a privileged operation.
> +.TP
> +.BR SIOCGIFNETMASK ", " SIOCSIFNETMASK
> +Get or set the network mask for a device using
> +.IR ifr_netmask .
> +For compatibility, only
> +.B AF_INET
> +addresses are accepted or returned.
> +Setting the network mask is a privileged operation.
> +.TP
> =A0.BR SIOCGIFMETRIC ", " SIOCSIFMETRIC
> =A0Get or set the metric of the device using
> =A0.IR ifr_metric .
> @@ -247,7 +303,10 @@
> =A0.SH NOTES
> =A0Strictly speaking,
> =A0.B SIOCGIFCONF
> -is IP specific and belongs in
> +and the other ioctls that only accept or return
> +.B AF_INET
> +socket addresses,
> +are IP specific and belong in
> =A0.BR ip (7).
> =A0.LP
> =A0The names of interfaces with no addresses or that don't have the
>
>
> --
> Brian F. G. Bidulock =A0 =A0=A6 The reasonable man adapts himself to =
the =A6
> bidulock-B8ReZeU34LJAfugRpC6u6w@public.gmane.org =A0 =A0=A6 world; the unreasonable one persists =
in =A0=A6
> http://www.openss7.org/ =A6 trying =A0to adapt the =A0world =A0to him=
self. =A6
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A6 Therefore =A0all =A0=
progress =A0depends on the =A6
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A6 unreasonable man. =
-- George Bernard Shaw =A6



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
