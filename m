From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Draft pthread_spin_lock(3) manual page
Date: Fri, 20 Oct 2017 16:55:55 +0200
Message-ID: <CAKgNAkhP_1By3_VjrMZ5qN5yp7BfX1G=9txEOgFkJ9H-wCj90Q@mail.gmail.com>
References: <CAKgNAkigca=v31L0hDMR7PdNEHgS8mhB6KWR0qZew-jhYD8dwg@mail.gmail.com>
 <fe6d752e-60a1-c8de-698c-ddd19d432110@redhat.com> <CAKgNAkjTZZWQpAwgg-m7Z-W=CQfS39CU5F+rr1B3msgf4SEBww@mail.gmail.com>
 <CAKCAbMjZK6BwJeh37TyJkwogD05GdvQod6LkJmvy4R+ad1w7fw@mail.gmail.com> <2d177560-7725-066a-7fff-bac06b9d153a@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2d177560-7725-066a-7fff-bac06b9d153a-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pedro Alves <palves-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Pedro,

On 20 October 2017 at 12:12, Pedro Alves <palves-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 10/19/2017 07:06 PM, Zack Weinberg wrote:
>> On Thu, Oct 19, 2017 at 1:46 PM, Michael Kerrisk (man-pages)
>
>> I meant to reply earlier.  This is a pet English grammar peeve of
>> mine: "shall" is a _directive_.  Specifications use it because they
>> are directing the implementors to make things happen, but in
>> documentation aimed at people _using_ an interface, the appropriate
>> word is "will".  The function _will_ fail and set errno under the
>> following conditions yada yada.  That's what it does.  You, the reader
>> of this manpage, do not have to do anything to make that happen.
>
> Technical writing guidelines usually suggest staying in the
> present tense, and avoid future tense though, because with "will"
> it's not clear whether you're describing how things behave as
> currently implemented or whether you're talking about how things
> will be implemented in the future.
>
> I.e.:
>   ... foo fails and sets errno if/when ...
> instead of:
>   ... foo will fail and set errno if/when ...
>
> Here's an example:
>
>
> http://www.datacenterjournal.com/technically-write-advice-technical-writing/
>
> And here's Sandra applying that same rule throughout GCC's manual:
>
>  [[doc] extend.texi copy-editing, 1/N (verb tenses)]
>  https://gcc.gnu.org/ml/gcc-patches/2012-10/msg02688.html
>
> (I recalled that whole series of Sandra's as I found
> it quite instructive back then.)

Fair enough, I've fixed "will fail" in a number of pages!

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
