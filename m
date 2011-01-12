From: Keith Thompson <kst-PZnT/k/XQVA@public.gmane.org>
Subject: Error in scanf(3) man page: "%n"
Date: Wed, 12 Jan 2011 08:40:41 -0800
Message-ID: <20110112164041.GA20130@nuthaus.mib.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: juergen perlinger <juergen.perlinger-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Keith Thompson <kst-PZnT/k/XQVA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

juergen perlinger, posting in the Usenet group
comp.std.c, points out an apparent error in the scanf(3)
man page.  The same error exists in the online version at

http://www.kernel.org/doc/man-pages/online/pages/man3/scanf.3.html

The discussion can be seen via

https://groups.google.com/d/topic/comp.std.c/j5g9-orzPc8/discussion

Here's the relevant portion of the man page:

    n   Nothing is expected; instead, the number of characters
        consumed thus far from the input is stored through the
        next pointer, which must be a pointer to int.  This is
        not a conversion, although it can be suppressed with the
        * assignment-suppression character.  The C standard says:
        "Execution of a %n directive does not increment the assignment
        count returned at the completion of execution" but the
        Corrigendum seems to contradict this.  Probably it is wise
        not to make any assumptions on the effect of %n conversions
        on the return value.

Here's the text from the C99 standard, quoted from
http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf
which includes the C99 standard with all three Technical
Corrigenda.  Changes are marked with change bars; there
are none in this section.

    n   No input is consumed. The corresponding argument shall be
        a pointer to signed integer into which is to be written
        the number of characters read from the input stream so
        far by this call to the fscanf function. Execution of a %n
        directive does not increment the assignment count returned
        at the completion of execution of the fscanf function. No
        argument is converted, but one is consumed. If the conversion
        specification includes an assignment-suppressing character
        or a field width, the behavior is undefined.

The man page's statement that "it can be suppressed with the *
assignment-suppression character" may be incorrect, or it may just
be glibc-specific (an implementation may define the behavior of
something whose behavior is left undefined by the standard); if
the latter, it would be useful to mention this.

I see nothing in any Corrigendum that supports the last two sentences
of the quoted paragraph in the man page.  (There's also nothing
relevant in the 1995 amendment to the C90 standard.)  As far as I
can tell, it's simply wrong.

-- 
Keith Thompson (The_Other_Keith) kst-PZnT/k/XQVA@public.gmane.org  <http://www.ghoti.net/~kst>
Nokia
"We must do something.  This is something.  Therefore, we must do this."
    -- Antony Jay and Jonathan Lynn, "Yes Minister"
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
