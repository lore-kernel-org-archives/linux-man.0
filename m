From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: still on times (2) man page
Date: Mon, 16 Apr 2012 08:35:22 +1200
Message-ID: <CAKgNAkj_nN=URRbQGoQ+1VpBeZDYNmPes6b9MV6TZeAmhnN6aA@mail.gmail.com>
References: <4F8AFD27.2000004@truelite.it>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8AFD27.2000004-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Simone,

On Mon, Apr 16, 2012 at 4:53 AM, Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>=
 wrote:
> I have another little issue about errors. In the RETURN VALUE section=
 is
> written:
>
> On error, (clock_t) -1 is returned, and errno is set appropriately.
>
> but no value for errno is specified. =A0From what I found digging ker=
nel
> sources the only error value returned seems to be EFAULT, if tms addr=
ess
> make fail copy_to_user. Should be specified?

Yes, probably better. For 3.39, I added the following:

=3D=3D
=2ESH ERRORS
=2ETP
=2EB EFAULT
=2EI tms
points outside the process's address space.
=3D=3D

Thank you!

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
