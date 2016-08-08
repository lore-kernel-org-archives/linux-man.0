From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: How to find bugs in man pages?
Date: Tue, 9 Aug 2016 07:38:57 +1200
Message-ID: <CAKgNAkgmLqBjPJUtp177Q3k54fOD-siTATRK-Ht=HNa_aEBW7Q@mail.gmail.com>
References: <49d6a2b1-0069-9325-08a1-c7e48205a787@gmail.com> <20160620204556.GP24532@vapier.lan>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160620204556.GP24532-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xose Vazquez Perez <xose.vazquez-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Mike,

On 21 June 2016 at 08:45, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 19 Jun 2016 16:46, Xose Vazquez Perez wrote:
>> I'm using: groff -z -b -wall manpage.x
>
> seems like something we could add to `make check`

What's the advantage over the existing "man --warnings" check in the
"check-groff-warnings" target?

I see that the groff check above throws some warnings on pages that
aren't shown by "man --warnings":

==> "warning: invalid input character code" for Unicode input characters
==> "warning: indent cannot be negative" where I use ".in -4" in my
    feature test macro descriptions

But, I'm not sure that either of those warnings is helpful. Neither
seems indicative of a real problem, but maybe I misunderstand
something.

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
