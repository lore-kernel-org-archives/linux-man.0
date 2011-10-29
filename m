From: Keith Thompson <keithsthompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Error in strcmp(3) man page and problem cloning from git
Date: Sat, 29 Oct 2011 11:37:05 -0700
Message-ID: <CAAHpriOLJ3ugK6nDuXC88JbAzTz_fJpn0O-0YtHDsTsMooYM_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Keith Thompson <Keith.S.Thompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

http://www.kernel.org/doc/man-pages/online/pages/man3/strcmp.3.html
says:

=A0=A0=A0 The strcmp() function compares the two strings s1 and s2.

This is incorrect.=A0 s1 and s2 are pointers, not strings.

Suggested wording:

=A0=A0=A0 The strcmp() function compares the two strings pointed to by =
s1 and s2.

I presume there are other errors like this.=A0 I can probably find the =
time to
track them down and submit a git patch; would that be useful?

Hmm, I just tried to clone the git repository, and it failed:

=A0=A0=A0 $ git clone git://git.kernel.org/pub/scm/docs/man-pages/man-p=
ages.git
=A0=A0=A0 Cloning into man-pages...
=A0=A0=A0 fatal: The remote end hung up unexpectedly


--=20
Keith Thompson <Keith.S.Thompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
