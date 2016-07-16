From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 134971] Clarify kill(2) man-page for permission to "send"
 signal 0
Date: Sat, 16 Jul 2016 13:12:15 +0000
Message-ID: <bug-134971-11311-G7DIxE3MmL@https.bugzilla.kernel.org/>
References: <bug-134971-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-134971-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D134971

--- Comment #2 from John Wiersba <jrw32982-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
Thanks, Michael!=C2=A0 That does make it clearer!



      From: "bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org"
<bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org>
 To: jrw32982-/E1597aS9LQAvxtiuMwx3w@public.gmane.org=20
 Sent: Saturday, July 16, 2016 6:24 AM
 Subject: [Bug 134971] Clarify kill(2) man-page for permission to "send=
" signal
0

https://bugzilla.kernel.org/show_bug.cgi?id=3D134971

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 What=C2=A0 =C2=A0 |Removed=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |Added
-----------------------------------------------------------------------=
-----
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Status|NEW=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |RESOLV=
ED
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC|=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Resolution|---=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |CODE_FIX

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hello John,

I agree the page could be clearer. What I did was change the paragraph
describing sig=3D=3D0 to:

=C2=A0 =C2=A0 =C2=A0 If sig is 0, then no signal is sent, but existence=
 and=C2=A0 permission
=C2=A0 =C2=A0 =C2=A0 checks=C2=A0 are=C2=A0 still=C2=A0 performed;=C2=A0=
 this=C2=A0 can be used to check for the
=C2=A0 =C2=A0 =C2=A0 existence of a process ID or process group ID that=
 the=C2=A0 caller=C2=A0 is
=C2=A0 =C2=A0 =C2=A0 permitted to signal.

I believe that makes the point clear, so I'll close this for now. Pleas=
e reopen
if you think there's still a problem.

Thanks,

Michael

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
