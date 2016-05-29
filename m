From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Small clarifications of strncasecmp docs
Date: Sun, 29 May 2016 06:55:03 -0500
Message-ID: <5ca41075-fb09-f3c5-4021-408dfbfc4003@gmail.com>
References: <CALgdb5KpgO0vYG+X31Uo3Jv8rfNKDZvASuMBYH5zmpiJLMWHKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALgdb5KpgO0vYG+X31Uo3Jv8rfNKDZvASuMBYH5zmpiJLMWHKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ori Avtalion <ori-prZfzsrDuP2LwutG50LtGA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello ori,

On 05/27/2016 04:15 PM, Ori Avtalion wrote:
> Hello,
> 
> I'm looking at the latest man-pages git revision 5d92f6.
> 
> The manpage for strncasecmp has a few wording issues that can be improved:
> 
> 1)
> In the DESCRIPTION section, "except it compares only the first n bytes of s1"
> 
> s1 can be shorter than n bytes. Consider adding "(at most)" after "first".
> 
> For comparison with reference materials, POSIX uses the wording "not
> more than n bytes", OSX and FreeBSD use "compares at most [...]".

I've made a change as you suggest.

> 2)
> In the RETURN VALUE section: "if s1 (or the first n bytes thereof) is
> found [...] to match [...] s2"
> 
> This could theoretically be read to suggest that the first n bytes of
> s1 are compared against the FULL s2, which is not the case.
> Consider removing the parenthetical altogether (thus, not mentioning
> 'n' at all). POSIX doesn't mention 'n' in its RETURN VALUE section.

And I've made this change too.

> 3)
> The RETURN VALUE section doesn't mention case insensitivity. It's in
> the DESCRIPTION, but perhaps it should also be in this section. POSIX
> mentions case-insensitivity in RETURN VALUE.
> 
> Consider adding "and ignoring case" after "respectively".

And I've made a change along these lines too.

Thanks for the report!

Cheers,

Michael

diff --git a/man3/strcasecmp.3 b/man3/strcasecmp.3
index fcfe438..3a72b04 100644
--- a/man3/strcasecmp.3
+++ b/man3/strcasecmp.3
@@ -55,8 +55,8 @@ respectively, to be less than, to match, or be greater than
 .PP
 The
 .BR strncasecmp ()
-function is similar, except it compares
-only the first
+function is similar, except that it compares
+no more than
 .I n
 bytes of
 .IR s1 .
@@ -68,11 +68,10 @@ and
 functions return
 an integer less than, equal to, or greater than zero if
 .I s1
-(or the first
-.I n
-bytes thereof) is found, respectively, to be
+is, after ignoring case, found to be
 less than, to match, or be greater than
-.IR s2 .
+.IR s2 ,
+respectively.
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see
 .BR attributes (7).


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
