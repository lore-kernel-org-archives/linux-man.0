From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 16031] slabinfo description inaccurate (out of date?)
Date: Tue, 10 Sep 2013 16:50:14 +0000
Message-ID: <bug-16031-11311-Kdvp0CwFBs@https.bugzilla.kernel.org/>
References: <bug-16031-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-16031-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D16031

Jorge Ner=C3=ADn <jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
                 CC|                            |jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #1 from Jorge Ner=C3=ADn <jnerin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
As of man-pages 3.51 this is still the case, but perhaps the correct th=
ing to
do being it a kernel file should be to add a note directing users to re=
ad
current /usr/src/linux/Documentation/vm/slub.txt and/or play with
/usr/src/linux/tools/vm/slabinfo.c

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
