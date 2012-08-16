From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 43252] bdflush(2) is obsolete
Date: Thu, 16 Aug 2012 06:22:48 +0000 (UTC)
Message-ID: <20120816062248.A6BCA11FC6B@bugzilla.kernel.org>
References: <bug-43252-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-43252-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D43252


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|NEW                         |NEEDINFO
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-08-1=
6 06:22:48 ---
The bdflush(2) man page has long carried this text:

       Note:  Since Linux 2.6, this system call is deprecated and does
       nothing.  It is likely to disappear altogether in a future ker=E2=
=80=90
       nel release.  Nowadays, the task performed by bdflush() is han=E2=
=80=90
       dled by the kernel pdflush thread.

As far as I can see, the system call still exists, at least for x86-32.

If something further has changed (which exact recent kernel version, an=
d,
ideally a commit ID), please add this info to this bug.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
