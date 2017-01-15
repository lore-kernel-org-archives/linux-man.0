From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: MSG_TRUNC and UNIX domain sockets (unix(7))
Date: Mon, 16 Jan 2017 10:00:30 +1300
Message-ID: <CAKgNAkiJV4sKi8pvfW4JK_Y1fw5OCUdLC_tnNGq-xkBjo2=-KQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Polovko <sergey-r6a5ZGF03PZBDLzU/O5InQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 16 January 2017 at 08:56, Sergey Polovko <sergey-r6a5ZGF03PZBDLzU/O5InQ@public.gmane.org> wrote:
> Hi,
>
> It seems that unix(7) and recv(2) man pages have different information about using MSG_TRUNC flag with UNIX domain sockets.
> Unix(7) man page says that this flag is not supported by UNIX domain sockets but actually it does. I wrote a simple program to
> check usage of this flag. Recv(2) man pages says that it supports since linux 3.4. Unfortunately I have no such old kernel near me
> but on 3.11, 3.13, 3.18 and 4.4 that I have this flag works with AF_UNIX sockets.
>
> Could you please fix that?

Thanks. The recv(2) page is indeed correct. I've updated the unix(7)
page to note the change in Linux 3.4.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
