From: "Carlos O'Donell" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Subject: Re: Differences between man-pages and libc manual safety markings
Date: Mon, 20 Oct 2014 11:47:31 -0400
Message-ID: <CAE2sS1jbGRT4uvBBVAPJkX2Mi4gHG=ii_G713MHhQzyGxO4yyw@mail.gmail.com>
References: <544118FA.3070003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <544118FA.3070003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Oct 17, 2014 at 9:26 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I was comparing some of the MT-Safety markings in man-pages versus the glibc
> manual (https://www.gnu.org/software/libc/manual/html_mono/libc.html)
> I found four cases that seem to contradict. Are there errors in either
> the man pages or in the glibc manual?

What's missing here is detailed analysis notes.

In glibc we added the detailed notes into the comments, and Alex did a
great job maintaining those.

Peng, if you have detailed notes, please provide them so we can
compare to glibc's notes.

> ==
> ctermid.3       MT-Unsafe race:ctermid/!s
>         glibc: MT-Safe
>
> man-pages and glibc manual disagree (man-pages seems to be more
> precise than glibc).

IMO, Alex's original marking is correct.

The code in question is a POSIX stub:
===
char *
ctermid (s)
     char *s;
{
  static char name[L_ctermid];

  if (s == NULL)
    s = name;

  return strcpy (s, "/dev/tty");
}
===

Threads could race to set `s` to point to `name` and it would be fine.

Similarly threads could race to write to characters in `s` and it
would also be fine.

They all copy the same thing into the destination buffer.

It is only unsafe if you can prove the intermediate results of a
pointer copy or strcpy change bytes in the destination string in ways
that make it invalid during the copying.

Lastly, note that because `s` is not an opaque type, and the user
controls it, and we never mark a function unsafe if it's a user
controlled buffer. We expect the user to manage that buffer, otherwise
tons of functions become unsafe.

> ==
> getcwd.3        MT-Safe env
>         glibc: MT-Safe
>
> man-pages and glibc manual disagree on "env" (man-pages seems
> to be more precise than glibc).

In this particular case I again think glibc's notation is correct. I
don't see why `env` is involved in getcwd. Please provide more
detailed rationale.

> ==
> getlogin.3      MT-Unsafe race:cuserid/!string locale
>         glibc: MT-Unsafe race:getlogin race:utent sig:ALRM timer locale
>
> man-pages and glibc manual disagree on "race:cuserid/!string" versus
> "race:getlogin"

Peng or others needs to provide more detailed rationale for why they
arrived at this result.

> ==
> regex.3         MT-Safe env
>         glibc: MT-Safe locale
>
> man-pages and glibc manual disagree on "env" versus "locale"

All of the functions in regex touch locales, and therefore we mark
this function `MT-Safe locale` because the `locale` annotations are
defined as being useful to note that MT-Safety is at risk if locale is
modified. Again, functions that modify locales are marked MT-Unsafe
const:locale to indicate that using them would break these functions.

Why is this marked `env`? Is it because the initialization of the
localization information might depend on the environment settings for
the locale? If you can prove that then it might be `MT-Safe env
locale`, but I the initialization is done via setlocale() and
therefore that function has the appropriate markings (not this one).

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
