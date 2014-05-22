From: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: Re: [PATCH] check_protypes.pl: semi-automatic consistency checks
Date: Thu, 22 May 2014 11:09:56 +0200
Message-ID: <87ppj689i3.fsf@rasmusvillemoes.dk>
References: <1400544046-4503-1-git-send-email-rv@rasmusvillemoes.dk>
	<537D9B87.1070200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537D9B87.1070200-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Michael Kerrisk's message of "Thu,
	22 May 2014 08:39:03 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

"Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> A question (which you may or may not be interested in ;-)):
> How feasible do you think it would be to write a script that
> tells me the FTM requirements for a given API?

Parsing the glibc headers is probably out of the question, also because of:

> (Note that the answer will very across glibc versions, so such a
> script would need as input both header files and and some
> glibc-version-specific table mapping the __USE internal macros back to
> FTM settings.

So I would probably let gcc do the work, using a sort of "binary-search"
over the possible combinations of FTMs (complicated by the various FTMs
not providing a linearly increasing set of features, but rather a weird
tree of mutual implications). Something like

(1) create foo.c file containing nothing but #include of the header(s) we
think are necessary

(2) compile with gcc -D_GNU_SOURCE -aux-info foo.aux -o /dev/null -c
foo.c

(3) check that the function we want is actually listed in the .aux file
(these are very easy to parse). If not, we (a) need more/other
headers, (b) have a too old glibc installed and/or (c) need more FTMs,
such as _ISOC11_SOURCE.

If the function is exposed using _GNU_SOURCE, one can then repeat step
(2) with -D_GNU_SOURCE replaced by various combinations of the other
FTMs; at each step recording whether the function is exposed or
not. This should be scriptable, so one gets lots of yes/no data points.

But how one goes from these data points to something like (taken from
valloc(3))

      _BSD_SOURCE ||
          (_XOPEN_SOURCE >= 500 ||
              _XOPEN_SOURCE && _XOPEN_SOURCE_EXTENDED) &&
          !(_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600)

I have no idea.

Rasmus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
