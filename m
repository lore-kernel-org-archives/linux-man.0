From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: symlinkat, unlinkat man page problem
Date: Sat, 24 Mar 2012 23:48:09 +1300
Message-ID: <CAKgNAkhqBd_Or7y=pRuC9rtoRNx9PCMH-2Eu3Qn0Fs9XRuYj5g@mail.gmail.com>
References: <4B1E574F.20805@byu.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B1E574F.20805-PGZyUNKar/Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Eric

On Wed, Dec 9, 2009 at 2:40 AM, Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org> wrote:
> Per POSIX and the system headers, symlinkat and unlinkat both live in
> <unistd.h>, but:
>
> http://www.kernel.org/doc/man-pages/online/pages/man2/symlinkat.2.html
> claims <stdio.h>
>
> http://www.kernel.org/doc/man-pages/online/pages/man2/unlinkat.2.html
> claims <fcntl.h>

Thanks. Corrected for man-pages 3.38.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
