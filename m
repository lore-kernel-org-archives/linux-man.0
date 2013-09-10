From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 14723] Undocumented behaviour of connect() with SO_SNDTIMEO
Date: Tue, 10 Sep 2013 16:38:16 +0000
Message-ID: <bug-14723-11311-5Axjg1PUVo@https.bugzilla.kernel.org/>
References: <bug-14723-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-14723-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D14723

Jorge Ner=C3=ADn <jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
                 CC|                            |jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Jorge Ner=C3=ADn <jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
=46rom man-pages-3.51 socket(7):

       SO_RCVTIMEO and SO_SNDTIMEO
              Specify the receiving or sending timeouts until reporting=
 an
error.  The
              argument is a struct timeval.  If an input or output func=
tion
blocks for
              this  period  of  time,  and  data has been sent or recei=
ved, the
return
              value of that function will be the amount of  data  trans=
ferred;=20
if  no
              data  has  been  transferred and the timeout has been rea=
ched
then -1 is
              returned with errno set to EAGAIN or EWOULDBLOCK,  or=20
EINPROGRESS  (for
              connect(2))  just  as if the socket was specified to be
nonblocking.  If
              the timeout is set to zero (the default) then the operati=
on  will
 never
              timeout.  Timeouts only have effect for system calls that=
 perform
socket
              I/O (e.g., read(2), recvmsg(2), send(2), sendmsg(2)); tim=
eouts=20
have  no
              effect for select(2), poll(2), epoll_wait(2), and so on.


I think this bug can be closed.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
