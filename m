From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 55371] printf: a conversion specifier doesn't necessarily ask
 for an argument
Date: Tue, 05 May 2015 06:55:39 +0000
Message-ID: <bug-55371-11311-gTzFl5rgYW@https.bugzilla.kernel.org/>
References: <bug-55371-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-55371-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D55371

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
-----------------------------------------------------------------------=
-----
             Status|REOPENED                    |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #3 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Filipus Klutiero from comment #0)
> The format string of printf is quite complicated, and while its
> documentation is extensive, it has a bit too many errors and needs so=
me
> cleanup for comprehensibility.
>=20
> In particular, man 3 printf contains:
>=20
> By default, the arguments are used in the order given, where each '*'=
 and
> each conversion specifier asks for the next argument (and it is an er=
ror if
> insufficiently many arguments are given).
>=20
> This is inexact, as "%" is defined as a conversion specifier and does=
n't
> consume any argument.

Yes, but that's explained no less than twice further down the page.

> It's also unclear in that sentence what "next argument" refers to.=20

It seems clear enough to me. But, if you have a better proposal let me =
know.

> And "*"
> hasn't been introduced at that point, so that part is hard to follow =
("*" is
> defined in section The precision).

=46or this piece, I changed the text to:

       By default, the arguments are used in the order
       given, where each '*' (see Field width and Pre=E2=80=90
       cision below)  and  each  conversion  specifier
       asks  for the next argument

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
