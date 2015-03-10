From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Question about seccomp(2) man page example code
Date: Tue, 10 Mar 2015 18:58:26 +0100
Message-ID: <CAKgNAkg-K5wkw_DZVDDio9Lt7-YJOsT0c8ZreFCDAeu5zdP9uw@mail.gmail.com>
References: <CAKgNAkhz=Dx9SRVadU_cVEiU-yxjAPxANwd2ZyJUxoWZkYUQEQ@mail.gmail.com>
 <CAGXu5j+GCk9boJyMJ4nQfFsK=6eoX_dN1efFAG6MqzPnLDjM7w@mail.gmail.com>
 <CAKgNAki1U_X5qjzP0tCr9Br10ieNUDaWUavkucApktHc7P53HA@mail.gmail.com> <CAGXu5jLFjWqXXZVgp7G5UmAuauV1ifyF4GzQLNixenb4MDdGYg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5jLFjWqXXZVgp7G5UmAuauV1ifyF4GzQLNixenb4MDdGYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 10 March 2015 at 18:51, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Tue, Mar 10, 2015 at 10:46 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hi Kees,
>>
>> On 10 March 2015 at 18:41, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>> On Tue, Mar 10, 2015 at 10:24 AM, Michael Kerrisk (man-pages)
>>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> Hi Kees,
>>>>
>>>> I was looking further at the seccomp(2) man page we put togetehr a
>>>> while ago, and in particular at the example [1]. I realized that f=
rom
>>>> a readability view, the order of the statements is rather contorte=
d,
>>>> so that we have branches to the end of the code (labels 5 and 6) t=
o
>>>> handle the syscall and arch mismatch cases, rather than swapping t=
he
>>>> branch order on the statements labeled 0 and 1, and having the kil=
l
>>>> statements immediately follow the test statements.
>>>>
>>>> However, I presume the ordering is as it is for efficiency reasons=
, so
>>>> that the common case involves no branch forward (i.e., a branch of=
fset
>>>> of 0). Is that the case? If so, probably something should be said =
in
>>>> the man page.
>>>
>>> I've never attempting timing tests to see if branching in the commo=
n
>>> path is actually any more expensive, but it's not unreasonable. I
>>
>> Okay.
>>
>>> think the main reason it was written this way was actually for size=
=2E
>>> There's 1 kill statement, which avoids repeating it, and (I think) =
is
>>> more readable.
>>
>> FWIW, I find it less readable ;-). That's because one has to count t=
he
>> BPF statements to branch over (that's why I added the "[n]" labels t=
o
>> the code). Also, it makes the code trickier to maintain, since, if o=
ne
>> adds some code in the branched over region, then the branch offset
>> needs to be modified. Just my 2=C2=A2.
>
> Yeah, that does become a pain. :) I wonder if maybe some mention of
> libseccomp should be made, since it operates as a front-end for
> generating seccomp filters, which makes most of this pain go away.

Good point. I'll add mention of libseccomp to the page.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
