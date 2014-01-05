From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Beginnings of a style guide
Date: Mon, 06 Jan 2014 12:51:49 +1300
Message-ID: <52C9F015.3050707@gmail.com>
References: <52C626BC.8040206@gmail.com> <201401051517.10600.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201401051517.10600.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/06/14 09:17, Mike Frysinger wrote:
> On Thursday 02 January 2014 21:55:56 Michael Kerrisk (man-pages) wrote:
>> .SH STYLE GUIDE
>> The following subsections represent the beginnings of a style guide
>> for the
>> .IR "man-pages"
>> project.
> 
> these are the kind of time based sentences that hang around for years ;)
> 
> how about:
> 	The following subsections describe the preferred style for the
> 	.IR "man-pages"

Yes, better. Changed.

> 	project.
> 
> also, is that quoting really necessary ?  

No; fixed.

> and should the - be escaped ?  

No. Maybe I need to clarify something. In general, the only time
you need a real dash is for numbers and pieces of code.

> you 
> don't do it below, and the style guide seems to indicate you should :)
> 
>> For details not covered below, the Chicago Manual of Style
>> is usually a good source.
> 
> would also add a suggestion of grepping around for pre-existing usage in the 
> tree.

Done.

>> .SS Use of gender-neutral language
>> As far as possible, use gender-neutral language in the text of man
>> page.
> 
> page->pages ?

Already fixed.

>> Use of "they" ("them", "themself", "their") as a gender-neutral singular
>> pronoun is acceptable for pages in the
>> .IR man-pages
>> project.
> 
> do we really need to mention the man-pages project again ?  seems superfluous 
> here.

Removed.

>> .SS Font conventions
>> .PP
>> For functions, the arguments are always specified using italics,
>> .IR "even in the SYNOPSIS section" ,
>> where the rest of the function is specified in bold:
> 
> where->while ?

"where" seems better to me.

>> .PP
>> .BI "    int myfunction(int " argc ", char **" argv );
>> .PP
>> Variable names should, like argument names, be specified in italics.
> 
> add a .PP for casts ?
> 
> how about discussing spacing ?  none before the argument list, but there 
> should be one between a cast and the casted object.

I might add this later.

>> .PP
>> Filenames (whether pathnames, or references to files in the
>> .I /usr/include
>> directory)
>> are always in italics (e.g.,
>> .IR <stdio.h> ),
>> except in the SYNOPSIS section, where included files are in bold (e.g.,
>> .BR "#include <stdio.h>" ).
>> When referring to a standard include file under
>> .IR /usr/include ,
>> specify the header file surrounded by angle brackets,
>> in the usual C way (e.g.,
>> .IR <stdio.h> ).
> 
> i wonder if we should say something like "a standard library include" rather 
> than explicitly listing "/usr/include".  after all, some headers are provided 
> by the C compiler (and likely won't be in /usr/include), and that path isn't 
> applicable when talking about cross-compilers or user-based installs, or other 
> not-quite-as-funky setups.  we could retain one mention of /usr/include in an 
> aside like "(e.g. headers in /usr/include)".

Yup. Made some changes here.

>> .PP
>> Complete commands should, if long,
>> be written as an indented line on their own, for example
>> .in +4n
>> .nf
>>
>> man 7 man-pages
>>
>> .fi
>> .in
> 
> should also mention that there should be a blank line before/after it.  
> otherwise, this code would pass the guide:

Done.

> Complete commands ...
> .br
> 	man 7 man-pages
> 
>> .PP
>> Any reference to the subject of the current manual page
>> should be written with the name in bold.
>> If the subject is a function (i.e., this is a Section 2 or 3 page),
>> then the name should be followed by a pair of parentheses
>> in Roman (normal) font.
> 
> is "Roman" really necessary here ?  it's not like changing fonts is even 
> feasible in man pages.

Here the distinction is "Roman" versus "Italic". It's the term used
by the "man" macros.

>> American English tends to use the forms "backward" "upward", 'toward",
> there's a stray single quote before the toward rather than double quote

Thanks,

>> .SS Capitalization
>> In subsection ("SS") headings,
>> capitalize the first word in the heading, but otherwise use lower case,
>> except where English usage (e.g., proper nouns) or programming
>> language requirements (e.g., identifier names) dictate otherwise.
> 
> might be useful to include an example here

I added

    .SS Unicode under Linux

as an example

>> .SS Preferred terms
> 
> how about:
> 	32-bit	32bit	Also applies to 64-bit/128-bit/etc...

Added.

> 	filesystem	file system, fs

Added.

 
>> The following table lists some preferred terms to use in man pages,
>> mainly to ensure consistency across pages.
> 
> the run time/user space/etc... items could do with a note pointing to the 
> hyphenation section below

I added a reference to that section.

>> .SS NULL, NUL, null pointer, and null character
> 
> would be nice to have a sentence on the preferred wording when talking about 
> an empty C string (i.e. "").

Do you have a suggested wording?

>> .SS Use of e.g., i.e., etc., a.k.a., and similar
> 
> how about also discouraging use of lists like "this/that/other/etc..." in 
> favor of "this, that, other, and so on"

It's rarely been a problem, so I'm loathe to clutter the list with 
that guideline (but I agree with it).

>> .SS Em-dashes
>> The way to write an em-dash (\(em) in *roff is with the macro "\\(em".
>> Em-dashes should be written
>> .I without
>> surrounding spaces.
> 
> would be nice to add an example of what this is replacing as not everyone 
> knows what an "em dash" is.

Done.

>> .SS Example programs and shell sessions
>> Manual pages can include example programs demonstrating how to
>> use a system call or library function.
> 
> can->may

Done.

Thanks for checking this over, Mike.

Updated version is in Git.

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
