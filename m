From: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
Subject: Re: Draft pthread_spin_lock(3) manual page
Date: Thu, 19 Oct 2017 14:06:25 -0400
Message-ID: <CAKCAbMjZK6BwJeh37TyJkwogD05GdvQod6LkJmvy4R+ad1w7fw@mail.gmail.com>
References: <CAKgNAkigca=v31L0hDMR7PdNEHgS8mhB6KWR0qZew-jhYD8dwg@mail.gmail.com>
 <fe6d752e-60a1-c8de-698c-ddd19d432110@redhat.com> <CAKgNAkjTZZWQpAwgg-m7Z-W=CQfS39CU5F+rr1B3msgf4SEBww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjTZZWQpAwgg-m7Z-W=CQfS39CU5F+rr1B3msgf4SEBww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Oct 19, 2017 at 1:46 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 18 October 2017 at 17:07, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
>>>        pthread_spin_trylock() can fail with the following errors:
>>>
>>>        EBUSY  The spin lock is currently locked by another thread.
>>
>> I always find the 'can fail' wording a bit wishy-washy for my tastes
>> and prefer: 'shall fail', along with a statement that defines the
>> conditions for failure. I say this only because English is not as
>> precise as I'd like so using 'shall' instead of 'can' makes this
>> failure mode clearer, indicating to the reader that it will happen
>> (here it's a bit obvious from the semantics of the function, since
>> otherwise trylock would be useless).
>
> Changed to "shall fail" (but this is not the only page with that problem :-} ).

I meant to reply earlier.  This is a pet English grammar peeve of
mine: "shall" is a _directive_.  Specifications use it because they
are directing the implementors to make things happen, but in
documentation aimed at people _using_ an interface, the appropriate
word is "will".  The function _will_ fail and set errno under the
following conditions yada yada.  That's what it does.  You, the reader
of this manpage, do not have to do anything to make that happen.

zw
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
