From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread safe
 with exceptions
Date: Wed, 11 Jun 2014 10:30:17 +0200
Message-ID: <CAKgNAkh029iy5=7+N1RiA1_X9Zeiv_coci59bFN1y-oQmOJykA@mail.gmail.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com>
 <CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com>
 <52FACFBB.6070607@cn.fujitsu.com> <CAE2sS1ijg2ef1WcswN0o+wmJOcgLDoCEbYrcNJyOxhS-HCxuSg@mail.gmail.com>
 <CAKgNAkix8vTrKEV_vicpD2yH88NQmiSrMR9dgKoQ1u2NkqZexA@mail.gmail.com> <CAE2sS1gZJCZdEhY7hpF8=dP069JFTyxD-B-nY9va0OTFV8jN4w@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE2sS1gZJCZdEhY7hpF8=dP069JFTyxD-B-nY9va0OTFV8jN4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Carlos, Haitao, Qian Lei, Alex,

Following up on this at last. Sorry for the delay.

On Tue, Feb 25, 2014 at 6:28 PM, Carlos O'Donell
<carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org> wrote:
> On Sun, Feb 23, 2014 at 5:16 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> The glibc manual is marked with them now, you can see iswblank here:
>>> http://www.gnu.org/software/libc/manual/html_mono/libc.html#index-iswblank-486
>>
>> I realize I could did through a lot of archived mail and answer these
>> questions, but I hope you can save me some time.
>
> My pleasure.
>
>> 1. How was the information about MT-Safety etc derived. I'm assuming a
>> lot of arduous manual inspection, right? (Or was there some automation
>> involved?)
>
> No automation. Manual inspection. It took Alexandre roughly a year to
> get through ~1000+ functions. After a while though the previous safety
> notes help you out immensely as you don't need to recurse deeply in a
> function when you know the properties of the functions you are
> calling.
>
>> 2. Does the glibc manual document the actual or the desired state of
>> the functions wrt to MT-Safety? Where these differ, does the manual
>> document that?
>
> The noes are preliminary so we make no promises.
>
> We document the actual state (not perfectly true, but it's the
> statement we want to make).
>
> We do not presently indicate what is the desired state.

Okay.

> Some interfaces deviate from the standards, and in some cases we have
> started marking that e.g. !posix.
>
> However, we need to do a second pass to ensure that:
>
> (a) We transition from preliminary to full guarantees about the API.
>
> -- When we do this transition we will look at what the desired
> guarantee is for each function.
>
> For example we may *never* guarantee setlocale is MT-safe, simply
> because the consequence of making it safe slows down every other
> function that uses locales.
>
> (b) We document the standard requirement for reference.
>
> (c) We add texinfo comments when we have notes to describe why we
> deviate from the standard.

Okay.

Is there a schedule/plan to bring these notes to something more definitive?

>> 3. Were the glibc manual changes generated manually, or was there some
>> degree of automation involved? I.e., has some markup been added to the
>> source that allows one to generate a summary of information about
>> MT-safety? As far as I can tell, that is not the case, but I wanted to
>> check.
>
> The glibc manual changes were generated manually.
>
> However, the notes per function are not text, but instead texinfo macros.
>
> The macros are then turned into the text you see.
>
> Therefore we have a meta-language in texinfo macros to describe the
> safety notes for each function.
>
> We have a regression test to ensure these notes follow the rules we
> set out for them e.g. if you mark something unsafe you note why using
> a valid marker for that safety note.
>
> Markup has not been added to the source to generate a summary of
> information about MT-safety.
>
> This is actually a GSoC project for glibc:
> https://sourceware.org/glibc/wiki/GSoC
>
> See "Dynamic Documentation"
>
> Fundamentally we can't move source code documentation into the manual
> because of the licensing barrier between GFDL and LGPLv2, *however*
> since gcc has the same problem with C++ we do have a known process for
> doing this easily (FSF maintainer given the right to relicense the
> generated docs and check them in).
>
> I also question the validity of copyrighting some of this information.
> For example I consider that the safety note information isn't
> copyrightable because it's a property of the function. Descriptive
> text about why we don't follow the standard would be copyrightable
> though.
>
>> The motivation of the above questions is of course that I wonder what
>> degree of automation might be achievable in making changes to the
>> documentation in man-pages.
>
> We considered this initially and we want to go in that direction, but
> for this initial pass we determined it would complicate the project
> and decided to do a manual pass.
>
> If you can suggest any technology we might wish to use, we could
> refine our GSoC project?

Okay. I've looked in more detail at the explanations on the glibc
manual nodes linked off
http://www.gnu.org/software/libc/manual/html_node/POSIX.html#POSIX
The approach looks good to me, and I think there is value in in the
man-pages and and the glibc manual using consistent annotations.

Practically speaking, I think this means:

1. We'd create an attributes(7) man page that has much of the same
information as in the glibc manual nodes listed above. If needed we
can rewrite to avoid any licensing issues. On the other hand, if
Alex(?) wants to make that text available under a suitable license
(e.g., one of those at
https://www.kernel.org/doc/man-pages/licenses.html). (Note, GFDL
doesn't work for man-pages, as explained on that web page.)

2. We redesign the ATTRIBUTES section that we use in man-pages. I
think it would make sense to use something like the Solaris
attributes(5) approach, where there is a table of safety information.
That table would be supplemented by notes, as needed. Thus, we might
have something like:

    ATTRIBUTES

        See attributes(7).

        +-----------+---------------+-----------+
        | Interface | Attribute     | Value     |
        +-----------+---------------+-----------+
        | l64a()    | Thread-safety | MT-Unsafe |
        +-----------+---------------+-----------+

        +-------------------+---------------+---------+
       | Interface         | Attribute     | Value   |
       +-------------------+---------------+---------+
        | bindresvport()    | Thread-safety | MT-Safe |
        +-------------------+---------------+---------+

        Before glibc 2.17, the bindresvport() function uses a static variable
        that is not protected, so it is not thread-safe.
        Since glibc 2.17, it protects the static variable with a lock,
        and is thus MT-Safe.

        +----------------------------+---------------+----------------+
        | Interface                  | Attribute     | Value          |
        +----------------------------+---------------+----------------+
        | atoi(), atol(), atoll()    | Thread-safety | MT-Safe locale |
        +----------------------------+---------------+----------------+

        +--------------------------+---------------------+---------+
        | Interface                | Attribute           | Value   |
        +--------------------------+---------------------+---------+
        | pthread_setcancelstate() | Async-cancel-safety | AC-Safe |
        +--------------------------+---------------------+---------+

An alternative approach would be to have subsections under ATTRIBUES,
with separate tables for Thread-safety, Async-signal-safety, and
Async-cancel-safety. Something like this:

    ATTRIBUTES

            See attributes(7).

        Thread-safety
            +-------------------+---------+
            | Interface         | Value   |
            +-------------------+---------+
            | bindresvport()    | MT-Safe |
            +-------------------+---------+

            Before glibc 2.17, the bindresvport() function uses a static
            variable that is not protected, so it is not thread-safe.
            Since glibc 2.17, it protects the static variable with a lock,
            and is thus MT-Safe.

        Async-cancel-safety

            +--------------------------+---------+
            | Interface                | Value   |
            +--------------------------+---------+
            | pthread_setcancelstate() | AC-Safe |
            +--------------------------+---------+

Does one of those approaches eem okay? Haitao, Qian Lei, what do you
think? (I appreciate that there's a lot of pages to be fixed to follow
this new approach: I'd do that, though you could help if you want.)

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
