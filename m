From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: select.2: s/minimum/maximum/
Date: Fri, 23 Aug 2013 10:51:12 +0200
Message-ID: <CAKgNAkhNC3sT6ZB7BVG8ai2FRPGTaWyE46z8WZJ-QTqN-XBaHg@mail.gmail.com>
References: <20130822153850.29990@gmx.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130822153850.29990-KK0ffGbhmjU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G.raud" <graud-KK0ffGbhmjU@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On Thu, Aug 22, 2013 at 5:38 PM, G.raud <graud-KK0ffGbhmjU@public.gmane.org> wrote:
>> Date: Thu, 22 Aug 2013 09:22:32 +0200
>> From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Subject: Re: select.2: s/minimum/maximum/
>>
>> On 08/20/13 01:00, G.raud wrote:
>> > In this part of the manpage:
>> >
>> > " The timeout argument specifies the minimum interval that select(=
)
>> >   should block waiting for a file descriptor to become ready.     =
   "
>>
>> This isn't correct (though maybe there is room for a better wording)=
=2E
>>
>> The 'timeout' places a ceiling on how long the call will block,
>> but that ceiling has the *minimum* value provided by the argument.
>> See what I mean?
>
> The text that you cite and that is not correct is extracted from the
> present manpage.

Your original report was rather briefly worded, and my "This" referred
to your subject line, not the text you cited.

> The corrected text should be:
>
>  " The timeout argument specifies the maximum interval that select()
>    should block waiting for a file descriptor to become ready.  "

Again, this is NOT correct. According to that statement, an
implementation that did not block at all would also be conformant,
since 0 is always less than or equal to whatever value is specified in
'timeout'. This point was the subject of changes in several man pages
(poll(2), epoll_pwait(2), select(2), sigtimedwait(2)) back in May
2012, after someone (I can't remember who) reported the point about
one of those pages.

> which is close to the POSIX description and is correct in that "speci=
fy"
> does not mean "is equal to" but can be understood as "is close to",
> which is all most of the programmers need to know.

Either of these interpretations would be a surprising way of defining
"specify", IMO.

By the way, I see what you mean about the POSIX description of
select(). It speaks of "maximum". But there, I would say the problem
is an imprecision in the standard. They get things worded better in
the poll() spec, which says: "poll()  shall  wait  at  least timeout
milliseconds".

> I suggest prepending the following before the complete description be=
wtween
> parentheses if a better (i.e. more explicit) wording is desired:
>
>   " timeout is a lower bound on the actual maximum waiting time."

Now, I do (I think) understand why the current text troubles you: it's
because the description is counter-intuitive. But, when one thinks
about it, one realizes that it is accurate (and s/minimum/maximum/ is
not). And the very next sentences are there to help the reader
understand this point:

       (This interval will be rounded up to the system  clock  granular=
=E2=80=90
       ity, and kernel scheduling delays mean that the blocking interva=
l
       may overrun by a small amount.)

One could I suppose reword something like this:

       The timeout argument specifies the interval that select()  shoul=
d
       block  waiting for a file descriptor to become ready.  In effect=
,
       timeout specifies a minimum interval: the timeout will be rounde=
d
       up  to the system clock granularity, and kernel scheduling delay=
s
       mean that the blocking interval may overrun by  a  small  amount=
=2E

But I'm not sure that that is really much of an improvement.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
