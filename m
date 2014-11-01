From: Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Sat, 01 Nov 2014 06:48:22 -0200
Message-ID: <ora94b8fxl.fsf@free.home>
References: <544118FA.3070003@gmail.com>
	<CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
	<54461F16.2080705@cn.fujitsu.com> <oroat3wbsl.fsf@free.home>
	<1414056576.8483.79.camel@triegel.csb> <or38adofh9.fsf@free.home>
	<1414152747.18538.26.camel@triegel.csb> <orioj9bfaa.fsf@free.home>
	<1414178101.18538.53.camel@triegel.csb> <orbnottnzb.fsf@free.home>
	<1414695671.10085.180.camel@triegel.csb>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414695671.10085.180.camel-I2ZjUw8blINjztcc/or7kQ@public.gmane.org> (Torvald Riegel's
	message of "Thu, 30 Oct 2014 20:01:11 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man@vger.kernel.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Oct 30, 2014, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> On Thu, 2014-10-30 at 16:24 -0200, Alexandre Oliva wrote:
>> >> > The hardware requires synchronizing accesses, and just the mere=
 presence
>> >> > of a data race may lead to undefined behavior of the program.
>>=20
>> Sorry, but =E2=80=9Cundefined behavior=E2=80=9D is standardese for =E2=
=80=9Cdon't do that=E2=80=9D.

> It's don't do that for a reason, not just don't do that and you'll be
> fine.

Yup.  But remember, it's users of the standard we implement that are no=
t
supposed to do that.  We can and often do get away with such stuff as
part of the implementation of the standard.  There's a long history of
doing so: remember when we implemented mutexes without standard atomics=
?
Nowadays, you might look at them and find those implementations
disgusting, and think =E2=80=9Chow the heck nobody thought of documenti=
ng the
reliance of this code on certain memory model properties that no longer
hold?=E2=80=9D  The obvious answer is that, back then, such properties =
were
perfectly normal and they had no idea something else might take over in
the distant future.  The point I'm trying to make is that there's only
so much future-proofness you can put into this sort of documentation.
The most difficult bits to document are not those that are surprising a=
s
of the writing of the docs, but those that are blatantly obvious to
pretty much anyone at that time, but that over time become surprising.
Historians run into lots of walls related with this sort of implicit
knowledge of a time.

> Please try to understand the issue.

I do.  It's very clear to me.  You wanted and hoped me to do a lot of
work that I was not supposed to do, and I didn't do it, in part because
I have little hope of seeing the future as well as you claim to be able
to.

> How is that supposed to work if you haven't documented all the
> assumptions you made (i.e., if ctermid is not just an outlier)?

It is, but if I were to document all the assumptions I made, I'd have t=
o
write several books of assumptions, encoding all the knowledge I've
accumulated about how past and present hardware architectures work, any
one of which might change in future architectures.

> Should I review all the code again?

Sure!  Clearly you're not happy with the annotations and comments I
made, so I don't see another way to go about it.

> you didn't seem interested back then.

There's a huge difference between being interested and being pragmatic
about fulfilling one's assignment from up the management chain, rather
than doing somebody else's work while slowing down one's own.

> You said elsewhere in the thread that you have no other information t=
han
> what's in the manual

=2E.. and what we covered in earlier discussions.

> what assumptions you made beyond the contracts of functions

Heh.  It's almost funny that you talk about the contracts of functions,
when you yourself claimed their definitions were not clear enough to
figure out what the precise requirements were.  Please make up your min=
d
about that point before wasting more my time, will you?

--=20
Alexandre Oliva, freedom fighter    http://FSFLA.org/~lxoliva/
You must be the change you wish to see in the world. -- Gandhi
Be Free! -- http://FSFLA.org/   FSF Latin America board member
=46ree Software Evangelist|Red Hat Brasil GNU Toolchain Engineer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
