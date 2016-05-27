From: Ori Avtalion <ori-prZfzsrDuP2LwutG50LtGA@public.gmane.org>
Subject: Small clarifications of strncasecmp docs
Date: Sat, 28 May 2016 00:15:33 +0300
Message-ID: <CALgdb5KpgO0vYG+X31Uo3Jv8rfNKDZvASuMBYH5zmpiJLMWHKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

I'm looking at the latest man-pages git revision 5d92f6.

The manpage for strncasecmp has a few wording issues that can be improved:

1)
In the DESCRIPTION section, "except it compares only the first n bytes of s1"

s1 can be shorter than n bytes. Consider adding "(at most)" after "first".

For comparison with reference materials, POSIX uses the wording "not
more than n bytes", OSX and FreeBSD use "compares at most [...]".

2)
In the RETURN VALUE section: "if s1 (or the first n bytes thereof) is
found [...] to match [...] s2"

This could theoretically be read to suggest that the first n bytes of
s1 are compared against the FULL s2, which is not the case.
Consider removing the parenthetical altogether (thus, not mentioning
'n' at all). POSIX doesn't mention 'n' in its RETURN VALUE section.

3)
The RETURN VALUE section doesn't mention case insensitivity. It's in
the DESCRIPTION, but perhaps it should also be in this section. POSIX
mentions case-insensitivity in RETURN VALUE.

Consider adding "and ignoring case" after "respectively".

-Ori
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
