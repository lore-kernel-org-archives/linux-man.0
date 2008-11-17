From: Loic Domaigne <tech-Z4JMKDdsf89Wk0Htik3J/w@public.gmane.org>
Subject: Re: For review: pthread_testcancel.3
Date: Mon, 17 Nov 2008 20:44:11 +0100
Message-ID: <4921C98B.9000603@domaigne.com>
References: <cfd18e0f0811141046t66b013dev7abc0fb9a36a96bf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0811141046t66b013dev7abc0fb9a36a96bf-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, josv-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Karsten Weiss <K.Weiss-Pt+Xe7GJXK+P2YhJcF5u+nqWYbMAw+HU@public.gmane.org>, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

=46ine with me,

Lo=EFc.

> Okay -- really the last one for today.  Any reviewers for pthread_tes=
tcancel.3
>=20
> Cheers,
>=20
> Michael
>=20
> .\" Copyright (c) 2008 Linux Foundation, written by Michael Kerrisk
> .\"     <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> .\"
> .\" Permission is granted to make and distribute verbatim copies of t=
his
> .\" manual provided the copyright notice and this permission notice a=
re
> .\" preserved on all copies.
> .\"
> .\" Permission is granted to copy and distribute modified versions of=
 this
> .\" manual under the conditions for verbatim copying, provided that t=
he
> .\" entire resulting derived work is distributed under the terms of a
> .\" permission notice identical to this one.
> .\"
> .\" Since the Linux kernel and libraries are constantly changing, thi=
s
> .\" manual page may be incorrect or out-of-date.  The author(s) assum=
e no
> .\" responsibility for errors or omissions, or for damages resulting =
from
> .\" the use of the information contained herein.  The author(s) may n=
ot
> .\" have taken the same level of care in the production of this manua=
l,
> .\" which is licensed free of charge, as they might when working
> .\" professionally.
> .\"
> .\" Formatted or processed versions of this manual, if unaccompanied =
by
> .\" the source, must acknowledge the copyright and authors of this wo=
rk.
> .\"
> .TH PTHREAD_TESTCANCEL 3 2008-11-14 "Linux" "Linux Programmer's Manua=
l"
> .SH NAME
> pthread_testcancel \- request delivery of any pending cancellation re=
quest
> .SH SYNOPSIS
> .nf
> .B #include <pthread.h>
>=20
> .B void pthread_testcancel(void);
> .sp
> Compile and link with \fI\-pthread\fP.
> .SH DESCRIPTION
> Calling
> .BR pthread_testcancel ()
> creates a cancellation point within the calling thread,
> so that a thread that is otherwise executing code that contains
> no cancellation points will respond to a cancellation request.
>=20
> If cancelability is disabled (using
> .BR pthread_setcancelstate (3)),
> or no cancellation request is pending,
> then a call to
> .BR pthread_cancel ()
> has no effect.
> .SH RETURN VALUE
> This function does not return a value.
> If the calling thread is cancelled as a consequence of a call
> to this function, then the function does not return.
> .SH ERRORS
> This function always succeeds.
> .\" SH VERSIONS
> .\" Available since glibc 2.0
> .SH CONFORMING TO
> POSIX.1-2001.
> .SH EXAMPLE
> See
> .BR pthread_cleanup_push (3).
> .SH SEE ALSO
> .BR pthread_cancel (3),
> .BR pthread_cleanup_push (3),
> .BR pthread_setcancelstate (3),
> .BR pthreads (7)
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
