From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 29972] Possibly bad EBADF error description in fsync(2)
Date: Tue, 10 Sep 2013 16:55:12 +0000
Message-ID: <bug-29972-11311-FV7aS4IEk6@https.bugzilla.kernel.org/>
References: <bug-29972-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-29972-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D29972

Jorge Ner=C3=ADn <jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
                 CC|                            |jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Jorge Ner=C3=ADn <jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
man-pages 3.51 fsync(2):

       EBADF  fd is not a valid open file descriptor.

I think this bug should be closed.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
