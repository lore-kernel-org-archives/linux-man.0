From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?=
	<socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man 4 tty_ioctl fixes
Date: Fri, 16 Jan 2015 17:28:39 +0600
Message-ID: <CAEmTpZGGR0xzgs6K8=kztyy_h-HyCkECH-4Wvybx4bQv0Pyxsg@mail.gmail.com>
References: <CAEmTpZH2JX1EuFCPDxZwCR8Sbxdgm8VJ+EN+HdhAC+b9YL49xg@mail.gmail.com>
	<CAKgNAkh+8n5wJanAoBCgQBEca8TgOe1c85NZaP_irepV1DYFjg@mail.gmail.com>
	<CAEmTpZHGO9zSy-KEaGg2ymaL3EX+c6ZcWwrSJ0xYd7fgO=Y=ZA@mail.gmail.com>
	<CAKgNAkh-VnSpfY00nVLQy6mRPgp1vLGawPes54iKe+YVsU7pyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkh-VnSpfY00nVLQy6mRPgp1vLGawPes54iKe+YVsU7pyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

2015-01-16 16:20 GMT+05:00 Michael Kerrisk (man-pages) <mtk.manpages@gm=
ail.com>:
> [CC restored]
>
> Hello =D0=9C=D0=B0=D1=80=D0=BA
>
> On 16 January 2015 at 12:05, =D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=
=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=80=D0=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> EXTPROC is not documented (can be set on c_lflag in termios structur=
e)
>> TIOCPKT_IOCTL is not documented (this value will appear when using
>> terminal in packet mode). Not sure if TIOCPKT_IOCTL will appear only
>> if EXTPROC is set.
>>
>> I want you to dcument that constants, and behaviour that will be
>> changed when applying that termios.
>
> I'll cut to the chase: I want *you* to do it. Why do you presume that
> I should do it?

Since this letter is the form of reporting bug in man pages. If you
know who can write CORRECT description of these constants -- it will
be nice.
I thought that you can write this description since, I think, you are
more expirienced developer than I. Also my English is not so good.


>
> Thanks,
>
> Michael
>
>
>> 2015-01-16 15:36 GMT+05:00 Michael Kerrisk (man-pages) <mtk.manpages=
@gmail.com>:
>>> Hello =D0=9C=D0=B0=D1=80=D0=BA.
>>>
>>> What is the purpose of your report?
>>>
>>> Thanks,
>>>
>>> Michael
>>>
>>>
>>> On 11 January 2015 at 20:58, =D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=
=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=80=D0=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> $ egrep '[^A-Z0-9]EXTPROC' -r /usr/include
>>>> /usr/include/x86_64-linux-gnu/bits/termios.h:# define EXTPROC 0200=
000
>>>> /usr/include/asm-generic/termbits.h:#define EXTPROC 0200000
>>>> <-------- undocumented
>>>>
>>>> $ fgrep TIOCPKT -r /usr/include
>>>> /usr/include/asm-generic/ioctls.h:#define TIOCPKT 0x5420
>>>> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_DATA 0
>>>> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_FLUSHREAD 1
>>>> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_FLUSHWRITE 2
>>>> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_STOP 4
>>>> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_START 8
>>>> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_NOSTOP 16
>>>> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_DOSTOP 32
>>>> /usr/include/asm-generic/ioctls.h:#define TIOCPKT_IOCTL 64  <-----=
- undocumented
>>>>
>>>> Some information:
>>>>
>>>> http://stackoverflow.com/questions/21641754/when-pty-pseudo-termin=
al-slave-fd-settings-are-changed-by-tcsetattr-how-ca
>>>> http://lists.gnu.org/archive/html/bug-readline/2011-01/msg00004.ht=
ml
>>>
>>>
>>>
>>> --
>>> Michael Kerrisk
>>> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
>>> Linux/UNIX System Programming Training: http://man7.org/training/
>>
>>
>>
>> --
>> Segmentation fault
>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



--=20
Segmentation fault
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
