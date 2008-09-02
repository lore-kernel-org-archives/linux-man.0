From: "Timothy S. Nelson" <wayland-r28gBBs99rhWo+R/V/U2/g@public.gmane.org>
Subject: [patch] hsearch.3: Reorder entire page for readability, add information
 for completeness (was: Re: Patch to hsearch.3 from man-pages-3.08)
Date: Wed, 3 Sep 2008 09:04:38 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0809030829530.3410@gwalcmai.nelson.org.au>
References: <alpine.LRH.1.10.0809021415510.3454@gwalcmai.nelson.org.au> <48BD4B48.3080108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <48BD4B48.3080108-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, 2 Sep 2008, Michael Kerrisk wrote:

> Hello Timothy,
>
> Timothy S. Nelson wrote:
>>     Updated information obtained from:
>> a)    Reading the source of search.h on my Fedora system (uses __USE_GNU
>>     instead of _GNU_SOURCE) -- this works in my test program
>
> This is wrong.  See <feature.h> and feature_test_macros(7).

 	Great!  Thanks.  I'll update the patch so that it tells people to 
#include <feature.h>.

>> b)    Reading the documentation:
>>     http://www.gnu.org/software/libc/manual/html_node/Hash-Search-Function.html#Hash-Search-Function 
>
> Your mail contains no description of what changes your patch makes,
> or why they should be useful.  (I am not a mind reader ;-).)

 	I guess I assumed you'd take a skim over the patch to find that out, 
but I can see why you wouldn't :).

 	Here's a summary of the changes:
-	_GNU_SOURCE didn't work for me, so I'm updating the documentation so
 	that it will work for others (now #include <feature.h>)
-	It was constantly difficult to find the piece of information I wanted
 	on this page, so I reordered a lot of the paragraphs; it's now both
 	more readable, and easier to find the information I want.  In
 	particular, this includes grouping information about particular
 	functions together under a heading with the function name
-	Various small readability enhancements and snippets of information
 	(ie. mentioning errno.h)

> Also, you combine several logical changes in a single patch.
> Please review http://www.kernel.org/doc/man-pages/patches.html
> and also take a look at man-pages(7).

 	Ok.  I guess I assumed that, since I was moving a lot of stuff anyway 
as part of the reorg, a few extra changes wouldn't show that much.  But I can 
see your point.  I'm reworking the patch, but until we agree (see below), 
there's no point me issuing another patch we disagree on.

>>     Having said that, though, it's mostly a reorganisation, and putting in 
>> little snippets of information that would've helped me.  I don't mind if 
>> the patch gets changed around or whatever, but I think the patch is an 
>> improvement on the current situation.
>
> But you don't explain what you changed, or why you think it
> improves things.
>
>> In particular, things I
>> wondered about are:
>> -    I have no idea about groff; if anyone can think of improvements, go
>>     for it (I did check it out with nroff -man though)
>> -    If it needs to be split into multiple pages (ie. hcreate*/hdestroy* on
>>     a separate page from hsearch*), that's fine by me too
>
> It's easier for me if you send patches inline.

 	Ok, I'll try to remember that.  Btw, sorry about the subject line too 
(hopefully better now).

>
>> --- man-pages-3.08/man3/hsearch.3     2008-08-27 16:09:02.000000000 +1000
>> +++ man-pages-3.08-tsn1/man3/hsearch.3        2008-09-02 14:11:07.000000000 
> +1000
>> @@ -41,7 +41,7 @@
>>  .sp
>>  .B "void hdestroy(void);"
>>  .sp
>> -.B #define _GNU_SOURCE
>> +.B #define __USE_GNU
>
> No.

 	Fixed in the next version.

>
>>  .br
>>  .B #include <search.h>
>>  .sp
>> @@ -58,23 +58,62 @@
>>  .BR hsearch (),
>>  and
>>  .BR hdestroy ()
>> -allow the user to create a hash table (only one at a time)
>> +allow the user to create and manipulate a hash table (only one at a time)
>>  which associates a key with any data.
>>  .PP
>> +The three functions
>> +.BR hcreate_r (),
>> +.BR hsearch_r (),
>> +.BR hdestroy_r ()
>> +are reentrant versions that allow the use of more than one table.
>> +The last argument used identifies the table.
>> +.PP
>> +.SS "hcreate()/hcreate_r()"
>> +.PP
>
> Why do you think this is better?  I think it is better to describe the
> non-reentrant functions first, and then describe the differences for
> the reentrant functions.

 	Well, as someone who only wants to use the re-entrant versions, I must 
say, this made things much more difficult for me to get a grip on.  As soon as 
I knew what the re-entrant versions were, I knew I didn't care about the other 
ones, so I didn't want to know about them.  Also, one of the first things I'm 
wondering when I come to this man page is "There's two sets of functions here; 
I need to choose the right one to start with; which is it?".  This answers 
that.

>>  First the table must be created with the function
>> -.BR hcreate ().
>> +.BR hcreate ()
>> +/
>> +.BR hcreate_r ().
>> +.TP
>> +.B Argument "nel"
>
> I don't really think such subdivisions of the text really help,
> and they are not the norm in man-pages.

 	If you're talking about the headings for the individual functions, 
then "man perlfunc" :).  But that's also why I was wondering whether there 
should be separate man pages.

 	If you're talking about the headings for the different arguments, then 
I guess I realise it's not quite like the others (although gethostbyname does 
something similar for the members of the hostent struct; would you like it if 
I reformatted it like that?).  I can name two advantages:
-	It makes it easier to quickly locate information
-	It immediately highlighted the fact that the "ret" argument was not
 	documented at all (which is something I've corrected in this patch)

> Also, you've removed the
> ..SH RETURN VALUE
> section, which really should be present in every .2 and .3 page
> (though it is currently missing from several).

 	I've divided the Return Value into two separate sections, as you've 
seen.  This is one of the reasons why I was wondering if there shouldn't be at 
least two separate man pages here; one for hsearch/hsearch_r, and one for 
everything else.

 	If your objection is that it's not marked ".SS", that's probably 
because I know nothing about groff.  Visually (with nroff -man), it somewhat 
resembles the information on the printf page.

>>  The argument \fInel\fP is an estimate of the maximum number of entries
>>  in the table.
>> -The function
>> -.BR hcreate ()
>> +The creation function
>>  may adjust this value upward to improve the
>>  performance of the resulting hash table.
>> -.PP
>> +.TP
>> +.B Argument "tab"
>> +As specified above, in the case of hcreate_r, this points to the
>> +table to be created.  The struct it points to must be malloc'd and
>
> Why must it be *malloc'd*?  Surely allocation anywhere (stack, heap) will do?

 	Sorry.  If you ever find out what I was thinking when I wrote this, 
let me know, 'cause I don't know what I was thinking :).

 	To me, the ideal situation for the man pages around the hash table 
management would be at least 3 separate man pages:
-	hsearch/hsearch_r
-	hcreate/hcreate_r
-	An overview of the hashing functions (referring to the other two man
 	pages)

 	I'm not sure where hdestroy/hdestroy_r should go; probably in its own 
page, possibly with the overview, and possibly with hcreate & friends.  I'm 
also not pushing for this change, but if you like the idea better than the way 
I've done things at the moment, then I'm happy to format things that way too 
(although then I'd probably need a suggestion on what man section the 
overview page would go best in).

 	In review, it seems to me like I agree with you, except for:
-	I think re-entrant functions should be discussed with their brethren,
 	rather than being discussed afterwards
-	I think there's some sort of sectioning needed, which you're not sure
 	of

 	Thanks for your careful review of the patch.

 	:)


---------------------------------------------------------------------
| Name: Tim Nelson                 | Because the Creator is,        |
| E-mail: wayland-r28gBBs99rhWo+R/V/U2/g@public.gmane.org    | I am                           |
---------------------------------------------------------------------

----BEGIN GEEK CODE BLOCK----
Version 3.12
GCS d+++ s+: a- C++$ U+++$ P+++$ L+++ E- W+ N+ w--- V- 
PE(+) Y+>++ PGP->+++ R(+) !tv b++ DI++++ D G+ e++>++++ h! y-
-----END GEEK CODE BLOCK-----

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
