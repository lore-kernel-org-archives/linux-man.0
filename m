From: "Timothy S. Nelson" <wayland-r28gBBs99rhWo+R/V/U2/g@public.gmane.org>
Subject: Re: [patch] hsearch.3: Reorder entire page for readability, add
 information for completeness
Date: Fri, 5 Sep 2008 19:32:08 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0809041436440.5125@gwalcmai.nelson.org.au>
References: <alpine.LRH.1.10.0809021415510.3454@gwalcmai.nelson.org.au> <48BD4B48.3080108@gmail.com> <alpine.LRH.1.10.0809030829530.3410@gwalcmai.nelson.org.au> <48BE4195.8000703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <48BE4195.8000703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, 3 Sep 2008, Michael Kerrisk wrote:

> Timothy S. Nelson wrote:
>> On Tue, 2 Sep 2008, Michael Kerrisk wrote:
>> 
>>> Hello Timothy,
>>> 
>>> Timothy S. Nelson wrote:
>>>>     Updated information obtained from:
>>>> a)    Reading the source of search.h on my Fedora system (uses __USE_GNU
>>>>     instead of _GNU_SOURCE) -- this works in my test program
>>> 
>>> This is wrong.  See <feature.h> and feature_test_macros(7).
>>
>>     Great!  Thanks.  I'll update the patch so that it tells people to 
>> #include <feature.h>.
>
> From feature_test_macros(7):
>
>   NOTES
>       <features.h>  is  a  Linux/glibc-specific  header   file.
>       Other  systems have an analogous file, but typically with
>       a different name.   This  header  file  is  automatically
>       included  by  other  header  files as required: it is not
>       necessary to explicitly include it  in  order  to  employ
>       feature test macros.
>
>>>> b)    Reading the documentation:
>>>>     http://www.gnu.org/software/libc/manual/html_node/Hash-Search-Function.html#Hash-Search-Function 
>>> 
>>> 
>>> Your mail contains no description of what changes your patch makes,
>>> or why they should be useful.  (I am not a mind reader ;-).)
>>
>>     I guess I assumed you'd take a skim over the patch to find that out, 
>> but I can see why you wouldn't :).
>>
>>     Here's a summary of the changes:
>> -    _GNU_SOURCE didn't work for me, so I'm updating the documentation so
>>     that it will work for others (now #include <feature.h>)
>
> If it didn't work for you then you probably didn't define the FTM before
> including *any* header file.  Including <features.h> should never be
> necessary.

------------------------------------------------------------
#include        <stdio.h>
#include        <stdlib.h>

/* #define              __USE_GNU */
#define         _GNU_SOURCE
#include        <search.h> /* hcreate, etc */

int     main(void) {
         void    *memspace;

         memspace = malloc(sizeof(struct hsearch_data));

         return;
}
------------------------------------------------------------

 	The code above produces this on my Fedora 6 box:

hashexample.c: In function 'main':
hashexample.c:11: error: invalid application of 'sizeof' to incomplete type 
'struct hsearch_data'


 	If I change it to __USE_GNU, it works.  #including features.h makes no 
difference either way.  I'm not sure who's to blame for this, but it'd be nice 
if the man page made some appropriate comment :).

>> I can name
>> two advantages:
[to using subheadings]
>> -    It makes it easier to quickly locate information
>> -    It immediately highlighted the fact that the "ret" argument was not
>>     documented at all (which is something I've corrected in this patch)
>
> Okay -- I already fixed that in my revision of the page.
> (But I got the name wrong: s/retval/ret/)

 	Yeah, I saw that later; that's why it didn't show up.  I was thinking 
more along the lines of general principles, though -- if there are 4 args, and 
4 headings, then something is right :).  But if that's not The Man Page 
Way(TM), then I'm sure I'll cope :).

>>> Also, you've removed the
>>> ..SH RETURN VALUE
>>> section, which really should be present in every .2 and .3 page
>>> (though it is currently missing from several).
>>
>>     I've divided the Return Value into two separate sections, as you've 
>> seen.  This is one of the reasons why I was wondering if there shouldn't be 
>> at least two separate man pages here; one for hsearch/hsearch_r, and one 
>> for everything else.
>
> One could debate the point in either direction (and man-pages
> has examples of doing things both ways).  In this case, I think
> the information can be conveyed compactly enough that it makes sense
> to describe everything on one page.

 	Ok.  I think I would've preferred a longer, more descriptive page, but 
then, I'm a Perl programmer :).  That idea (of the longer, more descriptive 
page, plus probably the Unix "one task, one tool" philosophy) led me in the 
direction of more pages with more information.  But with the rewrite you did, 
plus the reorg below, I'm not too fussed; it's much improved already :).

>>     If your objection is that it's not marked ".SS", that's probably 
>> because I know nothing about groff.  Visually (with nroff -man), it 
>> somewhat resembles the information on the printf page.
>
> There is no point in citing the strange exceptions.  (Many things in
> printf.3 could be tidied.)  I'm interested in consistency with
> the general layout in man-pages, also described in man-pages(7).
> I'm not inclined (without very good reason) to accept changes that
> create more divergence from the "standard" layout.

 	Sure, no worries :).

>>     In review, it seems to me like I agree with you, except for:
>> -    I think re-entrant functions should be discussed with their brethren,
>>     rather than being discussed afterwards
>
> Okay -- I'm not averse to that change.  I'll revise the page in that
> way and see how it looks.

 	Sounds good.  Let me know if you want me to review it when you're 
done.

 	It seems like the only remaining point of discussion is the 
_GNU_SOURCE business above.

 	HTH,


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
