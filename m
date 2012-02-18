From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: syncfs returns int (or long?)
Date: Sat, 18 Feb 2012 14:36:35 +1300
Message-ID: <CAKgNAkjJsffjEk=FpksTrKbsEuitvB6KNAx6xKNsD7vZzMsR6A@mail.gmail.com>
References: <4F368DF3.10605@truelite.it>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F368DF3.10605-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello SImone,

On Sun, Feb 12, 2012 at 4:49 AM, Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>=
 wrote:
> In man 2 syncfs (version 2011-09-07, also in the website) it is decla=
red as:
>
> void syncfs(int fd);
>
> but then is said:
>
> RETURN VALUE
> =A0 =A0 =A0 syncfs() returns 0 on success; on error, it returns -1 an=
d
> =A0 =A0 =A0 sets =A0errno to indicate the error.
>
> so it cannot be void. I get
>
> piccardi@monk:/usr/src/linux-source-3.1$ grep -r syncfs include/*
> include/asm-generic/unistd.h:#define __NR_syncfs 267
> include/asm-generic/unistd.h:__SYSCALL(__NR_syncfs, sys_syncfs)
> include/linux/syscalls.h:asmlinkage long sys_syncfs(int fd);
>
> So it seems to be at least long.

Thanks for the report! In glibc, the prototype is "int", so for
man-pages-3.36 I've changed it to "int".

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
