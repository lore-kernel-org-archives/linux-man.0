From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] close.2: Mention a need of shutdown before closing socket
Date: Fri, 7 Oct 2011 12:34:34 +0200
Message-ID: <CAKgNAki_fBFgoOHwsBbhocpzRt3_Zges49mLQwpkHfA+NYcxHA@mail.gmail.com>
References: <1314620800-15587-1-git-send-email-lczerner@redhat.com>
 <CAKgNAkjDZufWp-H7NeSRT40FGBRCkMuisesbGcdJnD94OZucUA@mail.gmail.com> <alpine.LFD.2.00.1110070906440.7183@dhcp-27-109.brq.redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1110070906440.7183-D5fXUWdM4RC5eBp5B7zZTR/sF2h8X+2i0E9HWUfgJXw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Lukas

On Fri, Oct 7, 2011 at 9:09 AM, Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wro=
te:
> On Fri, 7 Oct 2011, Michael Kerrisk wrote:
>
>> Lukas,
>>
>> On Mon, Aug 29, 2011 at 2:26 PM, Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=
 wrote:
>> > When dealing with sockets, we have to be sure that there is no rec=
v
>> > still blocking on it on another thread, otherwise it might block f=
orever,
>> > since no more messages will be send via the socket. We should advi=
ce to
>> > use shutdown before closing socket.
>>
>> I'm looking into this now. The picture may be more complex than this=
=2E
>> Tell me, so you have a Solaris system available for testing?
>>
>> Thanks,
>
> Hi Michael,
>
> Thanks for looking into this. Unfortunately I do not have any Solaris=
 system
> for testing, that was a customer report. His complaint was mainly not=
 because
> the behaviour on Linux differs, but because this was not documented a=
nywhere.

Okay. I will see if I can find a test system somewhere. (The system I
used to use seems to have gone away.)

Just FYI: I confirmed what you are seeing, but the issue seems more
general: basically, closing a file descriptor in one thread while
reading in another thread does not cause the read operation to
terminate (it will still read data if/when it becomes available).

By the way, I'm wondering about creating a small repo of test
programs. I might like to add a modified version of your test program
to that repo. Can you put that code under a Free License and supply a
copyright?

Thanks,

Michael



>> > Signed-off-by: Lukas Czerner <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> > ---
>> > =A0man2/close.2 | =A0 =A07 +++++++
>> > =A01 files changed, 7 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/man2/close.2 b/man2/close.2
>> > index a2a2961..02472f3 100644
>> > --- a/man2/close.2
>> > +++ b/man2/close.2
>> > @@ -114,6 +114,13 @@ other threads in the same process.
>> > =A0Since a file descriptor may be reused,
>> > =A0there are some obscure race conditions
>> > =A0that may cause unintended side effects.
>> > +.PP
>> > +When dealing with sockets, you have to be sure that there is no
>> > +.BR recv (2)
>> > +still blocking on it on another thread, otherwise it might block =
forever,
>> > +since no more messages will be send via the socket. Be sure to us=
e
>> > +.BR shutdown (2)
>> > +to shut down all parts the connection before closing the socket.
>> > =A0.\" Date: Tue, 4 Sep 2007 13:57:35 +0200
>> > =A0.\" From: Fredrik Noring <noring-zgYzP9v7iJcdnm+yROfE0A@public.gmane.org>
>> > =A0.\" One such race involves signals and ERESTARTSYS. If a file d=
escriptor
>> > --
>> > 1.7.4.4
>> >
>> >
>>
>>
>>
>>
>
> --



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
