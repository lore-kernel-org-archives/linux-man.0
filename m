From: "G.raud" <graud-KK0ffGbhmjU@public.gmane.org>
Subject: Re: select.2: s/minimum/maximum/
Date: Fri, 23 Aug 2013 17:10:07 +0200
Message-ID: <20130823151009.30030@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

I think the misunderstanding stems from the fact that we do not give th=
e
same meaning to the expressions "maximum waiting time" and "waiting tim=
e".
And excuse me for putting it bluntly, but I still think I am right abou=
t
the meaning I give to these expressions.

I will try to explain what those expressions are supposed to mean. =C2=A0=
A
"timeout" is a "_maximum_ time" spent in a operation, at which point th=
e
operation is to be cancelled. =C2=A0During the select(2) call the time =
is
spent waiting, hence the time spent in the select(2) call is a "waiting
time", whether or not the call returns because of a timeout or because
an FD is ready. =C2=A0The timeout in the case of the select(2) call is =
a
"waiting timeout", and a synonym for it would be "maximum waiting time"=
=2E

Hence using the phrase "minimum waiting time" to describe the timeout i=
s
antonymous, because one cannot guess that the minimum here refers to th=
e
rounding of the time and not to the use of it; by reading that phrase
one understands that timeout is a duration that has to elapse before
which the call to select(2) is allowed to return.

I think what you understand by "waiting time" is what I would call (as
certainly many others) a "maximum waiting time" or simply timeout, henc=
e
the misunderstanding. =C2=A0If you do not want to write about a maximum
waiting time (to avoid a confusion about the rounding that occurs for
example), at least modify the wording so that the above mentioned
misunderstanding cannot happen; for example substituting "waiting
timeout" for "waiting time" everywere would be sufficient.

> Date: Fri, 23 Aug 2013 10:51:12 +0200
> From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> To: "G.raud" <graud-KK0ffGbhmjU@public.gmane.org>
> Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Subject: Re: select.2: s/minimum/maximum/
>=20
> >> Date: Thu, 22 Aug 2013 09:22:32 +0200
> >> From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Subject: Re: select.2: s/minimum/maximum/
> >>
> > The text that you cite and that is not correct is extracted from th=
e
> > present manpage.
>=20
> Your original report was rather briefly worded, and my "This" referre=
d
> to your subject line, not the text you cited.

I considered that such could be the case and I answered accordingly.

> > The corrected text should be:
> >
> > =C2=A0" The timeout argument specifies the maximum interval that se=
lect()
> > =C2=A0 =C2=A0should block waiting for a file descriptor to become r=
eady. =C2=A0"
>=20
> Again, this is NOT correct. According to that statement, an
> implementation that did not block at all would also be conformant,
> since 0 is always less than or equal to whatever value is specified i=
n
> 'timeout'.

As I explained above by "maximum waiting time" I mean timeout, not
maximum timeout.

> This point was the subject of changes in several man pages
> (poll(2), epoll_pwait(2), select(2), sigtimedwait(2)) back in May
> 2012, after someone (I can't remember who) reported the point about
> one of those pages.

I looked at those manpages and, for the same reason, they have explanat=
ions
regarding the timeout that are at best clumsy when not wrong IMO.

> > which is close to the POSIX description and is correct in that "spe=
cify"
> > does not mean "is equal to" but can be understood as "is close to",
> > which is all most of the programmers need to know.
>=20
> Either of these interpretations would be a surprising way of defining
> "specify", IMO.

Those would only be _possible_ specifications made up by a reader at
that point in the text (that would turn up to be almost true). =C2=A0Sy=
nonyms
for "specify" could be "determine", "define", "characterize", "fix".

> By the way, I see what you mean about the POSIX description of
> select(). It speaks of "maximum". But there, I would say the problem
> is an imprecision in the standard.

I think the standard uses maximum to make it clear that the call has to
return right _after_ the timeout has elapsed.

> They get things worded better in
> the poll() spec, which says: "poll() =C2=A0shall =C2=A0wait =C2=A0at =
=C2=A0least timeout
> milliseconds".

You forgot the beginning of the sentence:
" If none of the defined events have occurred on any selected file
 =C2=A0descriptor, poll() shall wait at least timeout milliseconds. "
This is correct because of the conditional "If ..." and would not be
without it.

> > I suggest prepending the following before the complete description =
bewtween
> > parentheses if a better (i.e. more explicit) wording is desired:
> >
> > =C2=A0 " timeout is a lower bound on the actual maximum waiting tim=
e."
>=20
> Now, I do (I think) understand why the current text troubles you: it'=
s
> because the description is counter-intuitive. But, when one thinks
> about it, one realizes that it is accurate (and s/minimum/maximum/ is
> not).

I agree that s/minimum/maximum/ would make the statement less accurate
than you would like it to be since it would not have any hints of
possible roundings of the timeout; but as I explained above, I think
the present text is wrong because it reverses the meaning of timeout.

> And the very next sentences are there to help the reader
> understand this point:

True; those sentences are of help to someone who knows the select(2)
call already.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0(This interval will be rounded up to the s=
ystem =C2=A0clock =C2=A0granular=E2=80=90
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ity, and kernel scheduling delays mean tha=
t the blocking interval
> =C2=A0 =C2=A0 =C2=A0 =C2=A0may overrun by a small amount.)
>=20
> One could I suppose reword something like this:
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0The timeout argument specifies the interva=
l that select() =C2=A0should
> =C2=A0 =C2=A0 =C2=A0 =C2=A0block =C2=A0waiting for a file descriptor =
to become ready. =C2=A0In effect,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout specifies a minimum interval: the =
timeout will be rounded
> =C2=A0 =C2=A0 =C2=A0 =C2=A0up =C2=A0to the system clock granularity, =
and kernel scheduling delays
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mean that the blocking interval may overru=
n by =C2=A0a =C2=A0small =C2=A0amount.
>=20
> But I'm not sure that that is really much of an improvement.

I see it as a huge improvement because it does not reverse the meaning
of timeout.

Regards

--=20
G.raud Meyer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
