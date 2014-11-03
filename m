From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Mon, 03 Nov 2014 03:13:16 -0200
Message-ID: <or4mug27f7.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	<1414178101.18538.53.camel@triegel.csb> <orbnottnzb.fsf@free.home>
	<1414695671.10085.180.camel@triegel.csb> <ora94b8fxl.fsf@free.home>
	<1414838867.10085.431.camel@triegel.csb> <orwq7e22n2.fsf@free.home>
	<1414868298.10085.488.camel@triegel.csb>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414868298.10085.488.camel-I2ZjUw8blINjztcc/or7kQ@public.gmane.org> (Torvald Riegel's
	message of "Sat, 01 Nov 2014 19:58:18 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Nov  1, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> On Sat, 2014-11-01 at 16:32 -0200, Alexandre Oliva wrote:
>> That goes both ways.  While strcpy coded for current standards might
>> wish to make such optimizations, old code written for earlier standa=
rds
>> that did not make allowances for the proposed strcpy optimization wo=
uld
>> break.

> Which earlier standard are you referring to?

I think going back to C90 would do.

> Did any old standard have strcpy as something else than a
> sequentially-specified function?

Your question needs to be rephrased to take out the =E2=80=9Csequential=
ly-=E2=80=9D
noise that distorts your reasoning into some kind of tunnel vision.

There's nothing specifically sequential about it, nor is it only
before/after invocation: the standard states what the function does, an=
d
if it does something else that conflicts with the specification and is
observable, it diverges from the specification.  Right?


> especially if all it does is write to the destination
> string, in some way.

The way is not specified, but it does not state that it is to write
something else there before, and doing so is NOT allowed by the as-if
rule.  Consider a function that goes:

  for (;;) {
    extern char buffer[];
    strcpy (buffer, "foo");
    signal (SIGUSR1, testme);
    strcpy (buffer, "fool");
    signal (SIGUSR1, SIG_IGN);
  }=20


Now, if the signal handler testme were to inspect buffer[1] (knowing th=
e
only window in which it may be activated is the above, in a
single-threaded program), what values could it possibly find there?
Please justify with quotes from combinations of C and POSIX standards o=
f
the same vintage you can find.  How about buffer[0], and buffer[3]?


> It is not specified as operating on volatile-qualified data

volatile doesn't mean what you appear to suggest it does.

volatile means operations are not to be reordered, combined or otherwis=
e
optimized.  It does not mean writing garbage to a global variable is
allowed just because it's not volatile, any more than it means the as-i=
f
rule allows a function to release a lock on entry and take it again
before returning.  What if printf were to do that on the lock that
controls stdout?  Surely that would be observable, as much as the
contents of the buffer within the signal handler.

> They didn't specify rules for multi-threaded execution, did they?

Exactly!

I don't think you can push the as-if rule as far as you suggest when it
comes to global symbols, or other symbols whose pointers have escaped.
POSIX memory synchronization requirements might make speculative writes
defensible for asynchronicity arising from threads, but from async
signals?

I don't see allowances for that, do you?

--=20
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
=46ree Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
