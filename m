From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man 4 tty_ioctl fixes
Date: Fri, 16 Jan 2015 11:36:36 +0100
Message-ID: <CAKgNAkh+8n5wJanAoBCgQBEca8TgOe1c85NZaP_irepV1DYFjg@mail.gmail.com>
References: <CAEmTpZH2JX1EuFCPDxZwCR8Sbxdgm8VJ+EN+HdhAC+b9YL49xg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEmTpZH2JX1EuFCPDxZwCR8Sbxdgm8VJ+EN+HdhAC+b9YL49xg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello =D0=9C=D0=B0=D1=80=D0=BA.

What is the purpose of your report?

Thanks,

Michael


On 11 January 2015 at 20:58, =D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=
=D0=B5=D0=BD=D0=B1=D0=B5=D1=80=D0=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> $ egrep '[^A-Z0-9]EXTPROC' -r /usr/include
> /usr/include/x86_64-linux-gnu/bits/termios.h:# define EXTPROC 0200000
> /usr/include/asm-generic/termbits.h:#define EXTPROC 0200000
> <-------- undocumented
>
> $ fgrep TIOCPKT -r /usr/include
> /usr/include/asm-generic/ioctls.h:#define TIOCPKT 0x5420
> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_DATA 0
> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_FLUSHREAD 1
> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_FLUSHWRITE 2
> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_STOP 4
> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_START 8
> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_NOSTOP 16
> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_DOSTOP 32
> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_IOCTL 64  <------ u=
ndocumented
>
> Some information:
>
> http://stackoverflow.com/questions/21641754/when-pty-pseudo-terminal-=
slave-fd-settings-are-changed-by-tcsetattr-how-ca
> http://lists.gnu.org/archive/html/bug-readline/2011-01/msg00004.html



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
