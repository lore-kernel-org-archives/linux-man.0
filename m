From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] sock_diag.7: New page documenting NETLINK_SOCK_DIAG
 interface
Date: Mon, 4 Apr 2016 20:34:47 +1200
Message-ID: <57022727.6040606@gmail.com>
References: <20160315172558.GB2903@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160315172558.GB2903-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Dmitry

Thanks for taking the time to work on this!

I will probably have more comments, for a future draft, but here are
a few initial comments. Could you take a look and send a new draft?

On 03/16/2016 06:25 AM, Dmitry V. Levin wrote:
> From: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
> 
> Cowritten-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
> Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
> ---
>  man7/sock_diag.7 | 632 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 632 insertions(+)
>  create mode 100644 man7/sock_diag.7
> 
> diff --git a/man7/sock_diag.7 b/man7/sock_diag.7
> new file mode 100644
> index 0000000..d1be9cf
> --- /dev/null
> +++ b/man7/sock_diag.7
> @@ -0,0 +1,632 @@
> +.\" Copyright (c) 2016 Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
> +.\" Copyright (c) 2016 Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
> +.\"
> +.\" %%%LICENSE_START(GPLv2+_DOC_FULL)
> +.\" This is free documentation; you can redistribute it and/or
> +.\" modify it under the terms of the GNU General Public License as
> +.\" published by the Free Software Foundation; either version 2 of
> +.\" the License, or (at your option) any later version.
> +.\"
> +.\" The GNU General Public License's references to "object code"
> +.\" and "executables" are to be interpreted as the output of any
> +.\" document formatting or typesetting system, including
> +.\" intermediate and printed output.
> +.\"
> +.\" This manual is distributed in the hope that it will be useful,
> +.\" but WITHOUT ANY WARRANTY; without even the implied warranty of
> +.\" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +.\" GNU General Public License for more details.
> +.\"
> +.\" You should have received a copy of the GNU General Public
> +.\" License along with this manual; if not, see
> +.\" <http://www.gnu.org/licenses/>.
> +.\" %%%LICENSE_END
> +.TH SOCK_DIAG 7 2016-03-14 "Linux" "Linux Programmer's Manual"
> +.SH NAME
> +sock_diag \- querying information about sockets
> +.SH SYNOPSIS
> +.nf
> +.B #include <sys/socket.h>
> +.B #include <linux/sock_diag.h>
> +.BR "#include <linux/unix_diag.h>" " /* for UNIX domain sockets */"
> +.BR "#include <linux/inet_diag.h>" " /* for IPv4 and IPv6 sockets */"
> +
> +.BI "diag_socket = socket(AF_NETLINK, " socket_type ", NETLINK_SOCK_DIAG);"
> +.fi
> +.SH DESCRIPTION
> +The sock_diag netlink subsystem provides a mechanism for querying information
> +about sockets of various protocol families from the kernel.  This subsystem
> +can be used to query information about individual sockets or request a list of
> +those.

Sorry, it's not clear what "those" refers to. Could you replace with a noun?

> +
> +In the request the caller can specify the additional information it would
> +like to query about the socket, e.g. memory info or family-specific stuff.

s/query/obtain/

> +
> +When requesting a list of sockets, the caller can specify filters
> +that would be applied by the kernel to select a subset of sockets to report.
> +For now there's only the ability to filter sockets by state (connected,
> +listening, etc.)
> +
> +Note that sock_diag reports only those sockets that have a name,
> +i.e. either bound explicitly with
> +.BR bind (2)
> +or auto-bound ones (e.g. connected).  This is the same set of sockets that
> +is available via
> +.IR /proc/net/unix ,
> +.IR /proc/net/tcp ,
> +.IR /proc/net/udp ,
> +etc.
> +
> +.SS Request
> +The request starts with
> +.I "struct nlmsghdr"
> +header that has
> +.I nlmsg_type
> +field set to
> +.BR SOCK_DIAG_BY_FAMILY .

I think it might be useful to either show the nlmsghdr structure here, or 
add a note to tell the reader that this structure defintion is hown in 
netlink(7).

> +It is followed by a protocol family specific header that starts with a common
> +part shared by all protocol families:
> +
> +.in +4n
> +.nf
> +struct sock_diag_req {
> +    __u8 sdiag_family;
> +    __u8 sdiag_protocol;
> +};
> +.fi
> +.in
> +.PP
> +The fields of this structure are as follows:
> +.TP
> +.I sdiag_family
> +The protocol family of querying sockets.  It should be set to the appropriate

The meaning of "querying sockets" is unclear. Can you reword/elaborate?

> +.B PF_*

AF_* constant, I would say. POSIX doesn't talk about PF*, and in practice
there's always a one to one relationship between AF_*  and PF_*, so all other 
man pages use AF_*.

> +constant.
> +.TP
> +.I sdiag_protocol
> +Depends on
> +.IR sdiag_family .
> +It should be set to the appropriate
> +.B IPPROTO_*
> +constant for
> +.B PF_INET

AF_...

> +and
> +.BR PF_INET6,

AF_...

> +and to 0 otherwise.
> +.PP
> +If
> +.I nlmsg_flags
> +field of the
> +.I "struct nlmsghdr"
> +header has
> +.BR NLM_F_DUMP
> +flag set, then a list of sockets is being requested,
> +otherwise it is a query about an individual socket.
> +
> +.SS Response
> +The response starts with
> +.I "struct nlmsghdr"
> +header and is followed by an array of family-specific objects.
> +The array is to be accessed with the standard
> +.B NLMSG_*
> +macros from
> +.BR netlink (3)
> +API.
> +.PP
> +Each object is the NLA (netlink attributes) list that is to be accessed
> +with the
> +.B RTA_*
> +macros from
> +.BR rtnetlink (3)
> +API.
> +
> +.SS UNIX domain sockets
> +For UNIX domain sockets the request is represented in the following structure:
> +
> +.in +4n
> +.nf
> +struct unix_diag_req {
> +    __u8    sdiag_family;
> +    __u8    sdiag_protocol;
> +    __u16   pad;
> +    __u32   udiag_states;
> +    __u32   udiag_ino;
> +    __u32   udiag_show;
> +    __u32   udiag_cookie[2];
> +};
> +.fi
> +.in
> +.PP
> +The fields of this structure are as follows:
> +.TP
> +.I sdiag_family
> +This is a protocol family, it should be set to
> +.BR PF_UNIX .
> +.PP
> +.I sdiag_protocol
> +.PD 0
> +.TP
> +.PD
> +.I pad
> +These fields should be set to 0.
> +.TP
> +.I udiag_states
> +This is a bit mask that defines a filter of sockets states.
> +Only those sockets whose states are in this mask will be reported.
> +Ignored when querying for an individual socket.
> +Supported values are:
> +.PD 0
> +.RS
> +.IP "" 2
> +1 <<
> +.B TCP_ESTABLISHED
> +.IP
> +1 <<
> +.B TCP_LISTEN
> +.RE
> +.PD
> +.TP
> +.I udiag_ino
> +This is an inode number when querying for an individual socket.
> +Ignored for a bulk dump.

The meaning of "bulk dump" is not clear.

> +.TP
> +.I udiag_show
> +This is a set of flags defining which information to report.
> +Each requested info is reported back as a netlink attribute as described
> +below:
> +.RS
> +.IP "" 2
> +.B UDIAG_SHOW_NAME
> +.RS 4
> +The attribute reported in answer to this request is
> +.BR UNIX_DIAG_NAME .
> +The payload associated with this attribute is the name of the socket
> +to which it was bound (a sequence of bytes up to
> +.B UNIX_PATH_MAX
> +length).
> +.RE
> +.IP "" 2
> +.B UDIAG_SHOW_VFS
> +.RS 4
> +The attribute reported in answer to this request is
> +.BR UNIX_DIAG_VFS .
> +The payload associated with this attribute is represented in the following
> +structure:
> +
> +.in +4n
> +.nf
> +struct unix_diag_vfs {
> +    __u32 udiag_vfs_dev;
> +    __u32 udiag_vfs_ino;
> +};
> +.fi
> +.in
> +
> +The fields of this structure are as follows:
> +.PD 0
> +.RS 2
> +.IP "" 2
> +.I udiag_vfs_dev
> +The device number of the corresponding on-disk socket node.
> +.IP
> +.I udiag_vfs_ino
> +The inode number of the corresponding on-disk socket node.
> +.RE
> +.PD
> +.RE
> +.IP
> +.B UDIAG_SHOW_PEER
> +.RS 4
> +The attribute reported in answer to this request is
> +.BR UNIX_DIAG_PEER .
> +The payload associated with this attribute is a __u32 value
> +which is the peer's inode number.
> +This attribute is reported for connected sockets only.
> +.RE
> +.IP
> +.B UDIAG_SHOW_ICONS
> +.RS 4
> +The attribute reported in answer to this request is
> +.BR UNIX_DIAG_ICONS .
> +The payload associated with this attribute is an array of __u32 values
> +which are inode numbers of sockets that has passed the
> +.BR connect (2)
> +call, but hasn't been processed with
> +.BR accept (2)
> +yet.  This attribute is reported for listening sockets only.
> +.RE
> +.IP
> +.B UDIAG_SHOW_RQLEN
> +.RS 4
> +The attribute reported in answer to this request is
> +.BR UNIX_DIAG_RQLEN .
> +The payload associated with this attribute is represented in the following
> +structure:
> +
> +.in +4n
> +.nf
> +struct unix_diag_rqlen {
> +    __u32 udiag_rqueue;
> +    __u32 udiag_wqueue;
> +};
> +.fi
> +.in
> +
> +The fields of this structure are as follows:
> +.PD 0
> +.RS 2
> +.IP "" 2
> +.I udiag_rqueue
> +.RS 6
> +.IP "listening sockets:" 2
> +The number of pending connections which equals to
> +.B UNIX_DIAG_ICONS
> +array length.
> +.IP "established sockets:"
> +The amount of data in incoming queue.
> +.RE
> +.IP
> +.I udiag_wqueue
> +.RS 6
> +.IP "listening sockets:" 2
> +The backlog length which equals to the value passed as the second argument to
> +.BR listen (2).
> +.IP "established sockets:"
> +The amount of memory available for sending.
> +.RE
> +.RE
> +.PD
> +.RE
> +.IP
> +.B UDIAG_SHOW_MEMINFO
> +.RS 4
> +The attribute reported in answer to this request is
> +.BR UNIX_DIAG_MEMINFO .
> +The payload associated with this attribute is an array of __u32 values
> +described below in "Socket memory information" subsection.
> +.RE
> +.IP
> +.RE
> +.RS
> +The following attributes are reported back without any specific request:
> +.IP "" 2
> +.BR UNIX_DIAG_SHUTDOWN .
> +The payload associated with this attribute is __u8 value which represents
> +bits of
> +.BR shutdown (2)
> +state.
> +.RE
> +.TP
> +.I udiag_cookie
> +This is service field, both its cells should be set to \-1.

What does "service field" mean? I think this needs to be clarified.

> +.PP
> +The response to a query for UNIX domain sockets is represented as an array of
> +
> +.in +4n
> +.nf
> +struct unix_diag_msg {
> +    __u8    udiag_family;
> +    __u8    udiag_type;
> +    __u8    udiag_state;
> +    __u8    pad;
> +    __u32   udiag_ino;
> +    __u32   udiag_cookie[2];
> +};
> +.fi
> +.in
> +
> +followed by netlink attributes.
> +.PP
> +The fields of this structure are as follows:
> +.TP
> +.I udiag_type
> +This is set to one of the following constants:
> +.PD 0
> +.RS
> +.IP "" 2
> +.B SOCK_PACKET
> +.IP
> +.B SOCK_STREAM
> +.IP
> +.B SOCK_SEQPACKET
> +.RE
> +.PD
> +.TP
> +.I udiag_state
> +This is set to one of the following constants:
> +.PD 0
> +.RS
> +.IP "" 2
> +.B TCP_LISTEN
> +.IP
> +.B TCP_ESTABLISHED
> +.RE
> +.PD
> +.TP
> +.I udiag_ino
> +This is the socket inode number.
> +.PP
> +.I udiag_family
> +.PD 0
> +.PP
> +.I pad
> +.TP
> +.I udiag_cookie
> +These fields have the same meaning as in
> +.IR "struct unix_diag_req" .
> +.PD
> +
> +.SS IPv4 and IPv6 sockets
> +For IPv4 and IPv6 sockets the request is represented in the following structure:
> +
> +.in +4n
> +.nf
> +struct inet_diag_req_v2 {
> +    __u8    sdiag_family;
> +    __u8    sdiag_protocol;
> +    __u8    idiag_ext;
> +    __u8    pad;
> +    __u32   idiag_states;
> +    struct inet_diag_sockid id;
> +};
> +.fi
> +.in
> +
> +where
> +.I "struct inet_diag_sockid"
> +is defined as follows:
> +
> +.in +4n
> +.nf
> +struct inet_diag_sockid {
> +    __be16  idiag_sport;
> +    __be16  idiag_dport;
> +    __be32  idiag_src[4];
> +    __be32  idiag_dst[4];
> +    __u32   idiag_if;
> +    __u32   idiag_cookie[2];
> +};
> +.fi
> +.in
> +.PP
> +The fields of
> +.I "struct inet_diag_req_v2"
> +are as follows:
> +.TP
> +.I sdiag_family
> +This should be set to either
> +.B PF_INET
> +or
> +.B PF_INET6
> +for
> +.B IPv4
> +or
> +.B IPv6
> +sockets respectively.
> +.TP
> +.I sdiag_protocol
> +This should be set to one of the following constants:
> +.PD 0
> +.RS
> +.IP "" 2
> +.B IPPROTO_TCP
> +.IP
> +.B IPPROTO_UDP
> +.IP
> +.B IPPROTO_UDPLITE
> +.RE
> +.PD
> +.TP
> +.I idiag_ext
> +This is a set of flags defining which extended information to report.
> +Each requested info is reported back as a netlink attribute as described
> +below:
> +.RS
> +.IP "" 2

Replace the last line with

.TP

> +.B INET_DIAG_TOS
> +The payload associated with this attribute is a __u8 value
> +which is the TOS of the socket.
> +.IP

.TP

> +.B INET_DIAG_TCLASS
> +The payload associated with this attribute is a __u8 value
> +which is the TClass of the socket.  IPv6 sockets only.
> +For LISTEN and CLOSE sockets this is followed by
> +.B INET_DIAG_SKV6ONLY
> +attribute with associated __u8 payload value meaning whether the socket
> +is IPv6-only or not.
> +.IP

.TP

> +.B INET_DIAG_MEMINFO
> +The payload associated with this attribute is represented in the following
> +structure:
> +
> +.in +4n
> +.nf
> +struct inet_diag_meminfo {
> +    __u32 idiag_rmem;
> +    __u32 idiag_wmem;
> +    __u32 idiag_fmem;
> +    __u32 idiag_tmem;
> +};
> +.fi
> +.in
> +
> +The fields of this structure are as follows:
> +.PD 0

Delete previous line.

> +.RS 2

Make the last line

.RS

> +.IP "" 2

Change the last line to

.TP 12

> +.I idiag_rmem
> +The amount of data in the receive queue.
> +.IP

.TP

> +.I idiag_wmem
> +The amount of data that is queued by TCP but not yet sent.
> +.IP

.TP

> +.I idiag_fmem
> +The amount of memory scheduled for future use (TCP only).
> +.IP

.TP

> +.I idiag_tmem
> +The amount of data in send queue.
> +.RE
> +.PD

Remove previous line

> +.IP

.TP

> +.B INET_DIAG_SKMEMINFO
> +The payload associated with this attribute is an array of __u32 values
> +described below in "Socket memory information" subsection.
> +.IP

.TP

> +.B INET_DIAG_INFO
> +The payload associated with this attribute is protocol specific.
> +For TCP sockets it is an object of type
> +.IR "struct tcp_info" .
> +.IP

.TP

> +.B INET_DIAG_CONG
> +The payload associated with this attribute is a string that describes the
> +congestion control algorithm used.  For TCP sockets only.
> +.RE
> +.TP
> +.I pad
> +This should be set to 0.
> +.TP
> +.I idiag_states
> +This is a bit mask that defines a filter of sockets states.
> +Only those sockets whose states are in this mask will be reported.
> +Ignored when querying for an individual socket.
> +.TP
> +.I id
> +This is a socket id object that is used in dump requests, in queries
> +about individual sockets, and is reported back in each response.
> +Unlike UNIX domain sockets, IPv4 and IPv6 sockets are identified
> +using addresses and ports.  All values are in network byte order.
> +.PP
> +The fields of
> +.I "struct inet_diag_sockid"
> +are as follows:
> +.TP
> +.I idiag_sport
> +The source port.
> +.TP
> +.I idiag_dport
> +The destination port.
> +.TP
> +.I idiag_src
> +The source address.
> +.TP
> +.I idiag_dst
> +The destination address.
> +.TP
> +.I idiag_if
> +The interface number the socket is bound to.
> +.TP
> +.I idiag_cookie
> +This is a service field, both its cells should be set to \-1.

Again, I think the meaning of "service" filed needs to be clarified.

> +.PP
> +The response to a query for IPv4 or IPv6 sockets is represented as an array of
> +
> +.in +4n
> +.nf
> +struct inet_diag_msg {
> +    __u8    idiag_family;
> +    __u8    idiag_state;
> +    __u8    idiag_timer;
> +    __u8    idiag_retrans;
> +
> +    struct inet_diag_sockid id;
> +
> +    __u32   idiag_expires;
> +    __u32   idiag_rqueue;
> +    __u32   idiag_wqueue;
> +    __u32   idiag_uid;
> +    __u32   idiag_inode;
> +};
> +.fi
> +.in
> +
> +followed by netlink attributes.
> +.PP
> +The fields of this structure are as follows:
> +.TP
> +.I idiag_family
> +This is the same field as in
> +.IR "struct inet_diag_req_v2" .
> +.TP
> +.I idiag_state
> +This denotes socket state as in
> +.IR "struct inet_diag_req_v2" .
> +.PP
> +.I idiag_timer
> +.PD 0
> +.PP
> +.I idiag_retrans
> +.TP
> +.I idiag_expires
> +These fields are TCP-only and represent the timeout that is currently
> +in action for particular TCP state (0 for established sockets).

Can you elaborate with an example of a state that has a timeout.
(Is this just TIME_WAIT, or others also?)

> +.PD
> +.TP
> +.I idiag_rqueue
> +.RS 7
> +.IP "listening sockets:" 2
> +The number of pending connections.
> +.IP "other sockets:"
> +The amount of data in incoming queue.
> +.RE
> +.TP
> +.I idiag_wqueue
> +.RS 7
> +.IP "listening sockets:" 2
> +The backlog length.
> +.IP "other sockets:"
> +The amount of memory available for sending.
> +.RE
> +.TP
> +.I idiag_uid
> +This is the socket owner UID.
> +.TP
> +.I idiag_inode
> +This is the socket inode number.
> +
> +.SS Socket memory information
> +The payload associated with
> +.B UNIX_DIAG_MEMINFO
> +and
> +.BR INET_DIAG_SKMEMINFO
> +netlink attributes is an array of the following __u32 values:
> +.TP
> +.B SK_MEMINFO_RMEM_ALLOC
> +The amount of data in receive queue.
> +.TP
> +.B SK_MEMINFO_RCVBUF
> +The receive socket buffer as set by
> +.BR SO_RCVBUF .
> +.TP
> +.B SK_MEMINFO_WMEM_ALLOC
> +The amount of data in send queue.
> +.TP
> +.B SK_MEMINFO_SNDBUF
> +The send socket buffer as set by
> +.BR SO_SNDBUF .
> +.TP
> +.B SK_MEMINFO_FWD_ALLOC
> +The amount of memory scheduled for future use (TCP only).
> +.TP
> +.B SK_MEMINFO_WMEM_QUEUED
> +The amount of data queued by TCP, but not yet sent.
> +.TP
> +.B SK_MEMINFO_OPTMEM
> +The amount of memory allocated for socket's service needs (e.g. socket
> +filter).
> +.TP
> +.B SK_MEMINFO_BACKLOG
> +The amount of packets in the backlog (not yet processed).
> +.SH CONFORMING TO
> +The NETLINK_SOCK_DIAG API is Linux-specific.
> +.SH VERSIONS
> +.B NETLINK_SOCK_DIAG
> +was introduced in Linux 3.3.
> +.PP
> +.B UNIX_DIAG_MEMINFO
> +and
> +.BR INET_DIAG_SKMEMINFO
> +were introduced in Linux 3.6.
> +.SH SEE ALSO
> +.BR netlink (3),
> +.BR rtnetlink (3),
> +.BR netlink (7)

In the next iteration, I think it would be simplest to just include
the example program in the same patch.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
