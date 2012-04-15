From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: A bug? in the perror man page
Date: Sun, 15 Apr 2012 22:37:13 +1200
Message-ID: <CAKgNAki9hJEaxptFq5BBaE6Jky2_S0A6ObhPfM11qoNwnadYxA@mail.gmail.com>
References: <27915272.87611331289374219.JavaMail.defaultUser@defaultHost>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <27915272.87611331289374219.JavaMail.defaultUser@defaultHost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "jesus.otero" <jesus.otero-zg5kjA6Mr10@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jesus,

On Fri, Mar 9, 2012 at 11:36 PM, jesus.otero <jesus.otero-zg5kjA6Mr10@public.gmane.org> wrot=
e:
> Hi!
>
> Not sure if this is a bug, but, just in case...
>
> When searching how to print error messages without using perror, the =
man page
> of perror says
>
> "The =A0global error list sys_errlist[] indexed by errno can be used =
to obtain
> the error message without the newline. The largest message number pro=
vided in
> the table is sys_nerr -1. =A0Be careful when =A0directly =A0accessing=
 =A0this =A0list
> because new error values may not have been added to sys_errlist[]."
>
> Searching for sys_errlist on the kernel includes pointed me to the fi=
le
> <bits/sys_errlist.h> where it says that sys_errlist[] is deprecated,
> recommending you to use strerror. Doing a google search confirm me th=
is.
>
> Shouldn't this be reflected on perror's man page?

Yes, I think you're right. I added the sentence "The use of
sys_errlist[] is nowadays deprecated." to the man page.

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
