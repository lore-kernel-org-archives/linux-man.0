From: =?ISO-8859-1?Q?Zsb=E1n_Ambrus?= <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org>
Subject: Behavior of bind inet socket to port 0 in ip(7)
Date: Sat, 26 Sep 2009 16:58:13 +0200
Message-ID: <25d4951c0909260758x686129a2ibe5967716f6ec0a5@mail.gmail.com>
Reply-To: ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-1?Q?Zsb=E1n_Ambrus?= <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Dear Linux man-pages project,

This is a documentation bug report about the ip(7) manpage not clearly
documenting what happens if you bind an inet socket to port number
zero.

The description section of the ip(7) manpage clearly documents what
happens if you listen or connect an inet (tcp or udp) socket to which
you have not previously bound a local address with the bind function:
the kernel chooses a free port number for the socket (from a range you
can set with /proc) and binds it to INADDR_ANY and that port.  You can
then find out the local port number with the getsockname function.

Now sometimes you want to bind to a particular local address (such as
localhost) but still let the kernel choose the port number for you.
You could guess that binding with the sin_port member of the address
set to zero has this effect.  Indeed, this seems to work, at least for
tcp listeners on a recent linux kernel when I tried.

I have found no mention of this behavior in the linux manpages
(version 3.21 vanilla downloaded from kernel.org).  The gnu libc
documentation (edition 0.11 for gnu libc 2.6, the most relevant node
being "Ports") also does not document this, even though it too
mentions the effect of not calling bind (in fact it seems to imply
that 0 is a valid port number) -- I might report their bug to them
later depending on the result of this report.  I've only found a
slight hint in the FreeBSD manpage ip(4) saying "[the socket option]
IP_PORTRANGE may be used to set the port range used for selecting a
local port number on a socket with an unspecified (zero) port
number.".  The netcat program (the classic version written by "Hobbit"
only, not the versions supporting inet6) also uses bind this way if
you call it like "nc -lvs localhost", though this could be a bug in
that one program.

I don't know whether this behavior for zero port is even supposed to
work, and how portable it is, but whatever the truth is, it should be
mentioned in the manpage.  Please try to find out how much this is
supported and fix the manpage.  Also please email me with the results
so I can report the bug for the gnu libc documentation (in their
bugzilla) with correct information as well.

Thanks in advance,

Ambrus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
