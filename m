From: Craig Gallek <kraigatgoog@gmail.com>
Subject: Re: [PATCH v2] socket.7: Document some BPF-related socket options
Date: Tue, 1 Mar 2016 10:40:32 -0500
Message-ID: <CAEfhGiy7aDU8Xoz-nwRHLaF756UASNE08q394DFGBRD807yDaA@mail.gmail.com>
References: <1456767399-7533-1-git-send-email-kraigatgoog@gmail.com>
	<56D56901.5070307@gmail.com>
	<87k2lm7bks.fsf@zoro.exoscale.ch>
	<56D56F24.3090605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <56D56F24.3090605@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Vincent Bernat <bernat@luffy.cx>, linux-man@vger.kernel.org, netdev <netdev@vger.kernel.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>
List-Id: linux-man@vger.kernel.org

On Tue, Mar 1, 2016 at 5:29 AM, Michael Kerrisk (man-pages)
<mtk.manpages@gmail.com> wrote:
> On 03/01/2016 11:10 AM, Vincent Bernat wrote:
>>  =E2=9D=A6  1 mars 2016 11:03 +0100, "Michael Kerrisk (man-pages)" <=
mtk.manpages@gmail.com> :
>>
>>>           Once   the   SO_LOCK_FILTER  option  has  been  enabled,
>>>           attempts by an unprivileged process to change or  remove
>>>           the  filter  attached  to  a  socket,  or to disable the
>>>           SO_LOCK_FILTER option will fail with the error EPERM.
>>
>> You should remove "unprivileged". I didn't try to check for permissi=
ons
>> because I was just lazy (and I didn't have a need for it). As root, =
you
>> can just recreate another socket.
>
> Bother. That's what I meant to do, and then I omitted to do it! Done =
now
> And thanks for catching that, Vincent.
>
> Revised text below, with another query.
>
>        SO_LOCK_FILTER
>               When set, this option will prevent changing the  filter=
s
>               associated  with  the socket.  These filters include an=
y
>               set   using   the   socket   options   SO_ATTACH_FILTER=
,
>               SO_ATTACH_BPF,        SO_ATTACH_REUSEPORT_CBPF       an=
d
>               SO_ATTACH_REUSEPORT_EPBF.
>
>               The typical use case is for a privileged process to  se=
t
>               up  a  socket with restrictive filters, set SO_LOCK_FIL=
=E2=80=90
>               TER, and then either drop its  privileges  or  pass  th=
e
>               socket file descriptor to an unprivileged process.
>
>               Once   the   SO_LOCK_FILTER  option  has  been  enabled=
,
>               attempts to change or remove the filter  attached  to  =
a
>               socket,  or  to  disable  the SO_LOCK_FILTER option wil=
l
>               fail with the error EPERM.
>
> I think the second paragraph should probably drop mention of privileg=
es,
> right? In fact, maybe just drop the paragraph altogether?
Thanks Michael, all of your changes in the git tree look good to me.
I parsed the one-way nature of LOCK_FILTER completely backwards from
the commit message.  It's describing BSD's root-modify behavior, not
the implementation in Linux.  I think I like this last paragraph as
you have it to explicitly call out this as intended behavior.

Thanks again,
Craig

> Cheers,
>
> Michael
>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
