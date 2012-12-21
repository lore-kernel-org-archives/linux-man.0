From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 43287] scanf documentation example
Date: Fri, 21 Dec 2012 16:58:31 +0000 (UTC)
Message-ID: <20121221165831.9379811FA1A@bugzilla.kernel.org>
References: <bug-43287-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-43287-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D43287


Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|                            |INVALID
         AssignedTo|documentation_man-pages@ker |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
                   |nel-bugs.osdl.org           |




--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2012-12-2=
1 16:58:31 ---
The man page already explains this quite clearly though:

       The a modifier is not available if the program is compiled with
       gcc -std=3Dc99 or gcc  -D_ISOC99_SOURCE  (unless  _GNU_SOURCE  i=
s
       also specified), in which case the a is interpreted as a speci=E2=
=80=90
       fier for floating-point numbers (see above).

So, closing this bug.

Thanks,

Michael

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
