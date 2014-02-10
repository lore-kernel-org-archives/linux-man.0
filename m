From: "Carlos O'Donell" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Subject: Re: [PATCH] iswblank.3: ATTRIBUTES: Note function that is thread safe
 with exceptions
Date: Mon, 10 Feb 2014 11:03:14 -0500
Message-ID: <CAE2sS1g5w0jZ04EovvQoW=Cta4ACdHWVus-5zo+vw1J7E1SnZg@mail.gmail.com>
References: <1392013239-31138-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392013239-31138-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Feb 10, 2014 at 1:20 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> The function iswblank() is thread safe with exceptions.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR iswblank ()
> +function is thread-safe with exceptions.
> +It can be safely used in multithreaded applications, as long as
> +.BR setlocale (3)
> +is not called to change the locale during its execution.

Now that glibc 2.19 is out the door and using a standard set of
"exception" markers should we try to standardize the same markers?

For example in glibc this exception is called "locale" and iswblank is
marked "MT-Safe locale." With "locale" being described in detail in
the safety conceptions section.

For example the description you use is not quite technically correct.
It is possible to call setlocale, but you must guard the call to
setlocale and all other functions marked with the "locale" safety note
using a mutex to serialize access. That may be prohibitively
expensive, but it's an option.

In summary:
* Suggest you look at glibc 2.19 release and the safety notes used
there to simplify the linux kernel manual page notes.
* Add a manual page that specifically talked about "Safety concepts"
including thread, signal, and cancellation. Talk about things in more
detail there.

If need be Alex can repost the text for the linux kenrel man pages
project to reuse it under an alternate license.

Comments?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
