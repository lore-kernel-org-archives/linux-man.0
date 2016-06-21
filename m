From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 120671] missing info about userns restrictions
Date: Tue, 21 Jun 2016 08:48:18 +0000
Message-ID: <bug-120671-11311-HIWHdb9Viq@https.bugzilla.kernel.org/>
References: <bug-120671-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-120671-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D120671

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #6 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Micha=C5=82 Zegan from comment #5)
> yes, what I mean is just to make soe things more detailed in case som=
eone
> wonders.

=46air enough. See the new text below, which I've added to the man page=
=2E

> About filesystes, you can try to test mounting an ext4 filesystem aft=
er
> doing unshare of both userns and mountns, almost sure you will fail. =
I mean
> mounting the fs from inside of the ns. I may test that too when I hav=
e time,
> to be sure, but I am almost certain that is the case, especially that
> mounting an arbitrary fs could be a security risk because uids are no=
t
> shifted.

When you've tested to see check that there's an issue, please reopen th=
is bug
if needed. For now, I consider the problem to be addressed, as per the =
new text
below, so I'll close.

Cheers,

Michael


       Having  a  capability inside a user namespace permits a process
       to  perform  operations  (that  require  privilege)   only   on
       resources governed by that namespace.  In other words, having a
       capability in a user namespace permits  a  process  to  perform
       privileged   operations  on  resources  that  are  governed  by
       (nonuser) namespaces associated with the  user  namespace  (see
       the next subsection).  On the other hand, there are many privi=E2=
=80=90
       leged operations that affect resources that are not  associated
       with  any namespace type, for example, changing the system time
       (governed by CAP_SYS_TIME), loading a kernel  module  (governed
       by   CAP_SYS_MODULE),   and  creating  a  device  (governed  by
       CAP_MKNOD).  Only a process with privileges in the initial user
       namespace can perform such operations.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
