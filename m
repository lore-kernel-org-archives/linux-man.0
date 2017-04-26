From: Torvald Riegel <triegel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Wed, 26 Apr 2017 21:57:39 +0200
Message-ID: <1493236659.5890.149.camel@redhat.com>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b3a962de-6703-d8b9-18f7-138185171475-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, 2017-04-19 at 17:07 +0200, Michael Kerrisk (man-pages) wrote:
> The documentation around symbol versioning as used by the glibc dynamic
> linker (DL) is currently rather weak, and I'd like to add some pieces to
> various man pages (ld.so(8), dlsym(3), and possibly others) to improve
> this situation. Before that though, I'd rather like to check my
> understanding of the rules.

I can't comment on the specific questions you have, but I'd suggest to
reach out to Stephen Kell and Peter Sewell, as they have worked on
rigorous specifications of linking:
http://www.cl.cam.ac.uk/~pes20/rems/papers/oopsla-elf-linking-2016.pdf

That's static linking of course, but perhaps they'd be interested to
extend that work (or perhaps are already looking at this).

Sewell et al. have worked on rigorous specifications of memory models in
the past (eg, for C++), and those are *really* useful in practice.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
