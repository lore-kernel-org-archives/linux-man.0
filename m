From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 43249] New: connect(2) changes INADDR_ANY meaning for UDP
 sockets
Date: Mon, 14 May 2012 22:28:33 +0000 (UTC)
Message-ID: <bug-43249-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D43249

           Summary: connect(2) changes INADDR_ANY meaning for UDP socke=
ts
           Product: Documentation
           Version: unspecified
    Kernel Version: 3.0.0
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: man-pages
        AssignedTo: documentation_man-pages-ztI5WcYan/vQLgFONoPN62D2FQJk+8+b@public.gmane.org
        ReportedBy: sebastian.lauwers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        Regression: No


Created an attachment (id=3D73297)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=3D73297)
Testcase which demonstrates the bug scenario

The POSIX man page for connect(2) [1] specifies that:

> If the socket has not already been bound to a local address, connect(=
)
> shall bind it to an address which, unless the socket's address family
> is AF_UNIX, is an unused local address.

The Linux man page for connect(2) does not provide this information, an=
d this
may be confusing, regarding the following behaviour:

After creating a socket of type SOCK_DGRAM through socket(2), and calli=
ng
bind(2) on it to have it "listen" on all interfaces (through the use of
INADDR_ANY as value of sockaddr_in.sin_addr.s_addr), it is possible to =
call
connect(2) on said socket. This behaviour is correctly explained by the
connect(2) Linux man page [2]:

> If the socket sockfd is of type SOCK_DGRAM then addr is the address t=
o=20
> which datagrams are sent by default, and the only address from which =
data=E2=80=90
> grams are received.

However, upon doing so, the socket is no longer "bound" to any interfac=
e (as
could be assumed through the usage of INADDR_ANY), but one in particula=
r (and
it is apparently not possible to know which one, before calling connect=
(2)).
This seems to contradict the information provided by the ip(7) man page=
 [3]:

> When a process wants to receive new incoming packets or connections, =
it
> should bind a socket to a local interface address using bind(2). Only
> one IP socket may be bound to any given local (address, port) pair. W=
hen
> INADDR_ANY is specified in the bind call, the socket will be bound to
> all local interfaces.

I have attached a test-case which demonstrates this apparently conflict=
ing
behaviour.

I would suggest adding a paragraph or comment that would explain this s=
ubtlety,
as it can cause difficult to diagnose issues when using connected UDP s=
ockets.

[1]: http://www.unix.com/man-page/posix/3posix/connect/
[2]: http://linux.die.net/man/2/connect
[3]: http://linux.die.net/man/7/ip

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
