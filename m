From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ld.so.8: ffix, tfix, wfix
Date: Sat, 13 May 2017 14:02:45 +0200
Message-ID: <fafa4eeb-e58d-02de-fc74-7d7cecb0b4c4@gmail.com>
References: <20170510043239.ycgvwc7b5ohga7i4@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170510043239.ycgvwc7b5ohga7i4-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Branden,

I appreciate the effort here, but this this patch is way too
busy (makes too many different, unrelated changes).
This causes a number of problems:

* It's hard to relate the various change log comments
  to the various changes.
* I can't choose which pieces to apply. (I might agree with
  some parts of the patch, but not others.)
* If I am making parallel changes to the page (as it
  happens, by chance I am making a *lot* of parallel
  changes), there's a high chance that the patch won't
  apply as a whole. (And indeed, this patch doesn't apply.
  I've made manual fixes per the comments below.)
* It makes it difficult to deal with subsequent patches, (like
  your next patch), because I may not apply all of your patch.

On 05/10/2017 06:32 AM, G. Branden Robinson wrote:
>     ld.so.8: ffix, tfix, wfix
> 
>     * Use correct hyphen-minus in "ld-linux.so" in Name section; this does
>       not confuse lexgrog(1).

Fixed.

>     * Render names of ELF sections in italics, not bold, for consistency
>       with elf(5).

Not sure what the change is here. Nothing done.

>     * Use conventional markup for synopsis instead of the style used in
>       usage messages (no font changes, capitals for variables).
> 
>     * Respell filename reference to ld-linux.so to reflect the greater
>       variation of its name on multi-arch-aware hosts.  Call out the usage
>       of a shell glob in the notation since this is not commonly seen in
>       the name of a command being documented.
> 
>     * Replace LP macro with more commonly-used PP macro.

I agree that LP is less common than PP, but changes like this
also cause churn that is unneeded, unless there's a real problem
to fix.

>     * Mark up itemized lists using the prevailing man-pages convention.

I'm not sure we have a prevailing convention...

>     * Use font macros instead of font escapes, obtaining italic correction
>       where applicable.
> 
>     * Recast libc5 vs. glibc coverage to be more prose-like.

Not sure what the change is here, but would be best as a separate patch.

>     * Fix misplaced parenthesis and sentence fragment.

Not sure what the change is here, but would be best as a separate patch.

> 
>     * Generalize specific reference to "ld.so" to "the dynamic linker".

I made a couple of changes here.

>     * Improve markup of shell command examples.
>       + Use groff_man(7)'s .EX/.EE macros to obtain a constant-width font
>         (harmless if not available).
>       + Use explicit indentation requests (.in) instead of spaces in the
>         input file.  (See man-pages(7), "Indentation of structure
>         definitions, shell session logs, and so on".)

Discussion needed; best as a separate patch.

>     * Unhyphenate "execution-time" when used as a noun phrase.

Fixed.

>     * Fix doubled word.

Fixed.

>     * Use directional quotation marks in prose quotations.

I'm not sure whether this is worthwhile. Needs discussion, and a separate
patch.

>     * Fix missing \- in "\-\-inhibit-cache".

Fixed.

> 
>     * Mark up "readelf -n" as bold instead of italic since it's a literal
>       and not a filename, and make its space unbreakable.
>
>     * Use .IP without arguments to get a further indented paragraph at the
>       prevailing indentation level, instead of a blank input line, which has
>       different semantics and introduces too much vertical whitespace, as
>       can be seen with man -Tps.

Needs discussion. Perhaps a global fix is required across all man 
pages (ugh!).

>     * Consistently hyphenate adjective phrase "secure-execution" [mode].

Fixed.

>     * Use default inter-paragraph distance in Files section.

Not sure what the change is here. Discussion and separate patch needed.

>     * Mark up filename literals in italics, even "lib*.so*".

Not sure what the change is here. Discussion and separate patch needed.

>     * Remove subsection heading from Notes section; there is no
>       non-subsection material and only one subsection.

This is an example of a change where I don't agree. I think the
subsection heading here is nevertheless helpful, and "hardware
capabilities" are alluded to elsewhere in the page.

As you see, some pieces didn't get applied. But some of those
pieces a probably worthwhile fixing... Could you resubmit
in smaller pieces (and perhaps not all at once)?

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
