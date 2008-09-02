From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Patch to hsearch.3 from man-pages-3.08
Date: Tue, 02 Sep 2008 16:18:48 +0200
Message-ID: <48BD4B48.3080108@gmail.com>
References: <alpine.LRH.1.10.0809021415510.3454@gwalcmai.nelson.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LRH.1.10.0809021415510.3454-/IIiqYPLJX27UUr8seqV7NQ83Er7SCjg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Timothy S. Nelson" <wayland-r28gBBs99rhWo+R/V/U2/g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Timothy,

Timothy S. Nelson wrote:
>     Updated information obtained from:
> a)    Reading the source of search.h on my Fedora system (uses __USE_GNU
>     instead of _GNU_SOURCE) -- this works in my test program

This is wrong.  See <feature.h> and feature_test_macros(7).

> b)    Reading the documentation:
>     http://www.gnu.org/software/libc/manual/html_node/Hash-Search-Function.html#Hash-Search-Function 

Your mail contains no description of what changes your patch makes,
or why they should be useful.  (I am not a mind reader ;-).)

Also, you combine several logical changes in a single patch.
Please review http://www.kernel.org/doc/man-pages/patches.html
and also take a look at man-pages(7).

>     Having said that, though, it's mostly a reorganisation, and putting 
> in little snippets of information that would've helped me.  I don't mind 
> if the patch gets changed around or whatever, but I think the patch is 
> an improvement on the current situation.

But you don't explain what you changed, or why you think it
improves things.

 > In particular, things I
> wondered about are:
> -    I have no idea about groff; if anyone can think of improvements, go
>     for it (I did check it out with nroff -man though)
> -    If it needs to be split into multiple pages (ie. hcreate*/hdestroy* on
>     a separate page from hsearch*), that's fine by me too

It's easier for me if you send patches inline.

 > --- man-pages-3.08/man3/hsearch.3     2008-08-27 16:09:02.000000000 +1000
 > +++ man-pages-3.08-tsn1/man3/hsearch.3        2008-09-02 14:11:07.000000000 +1000
 > @@ -41,7 +41,7 @@
 >  .sp
 >  .B "void hdestroy(void);"
 >  .sp
 > -.B #define _GNU_SOURCE
 > +.B #define __USE_GNU

No.

 >  .br
 >  .B #include <search.h>
 >  .sp
 > @@ -58,23 +58,62 @@
 >  .BR hsearch (),
 >  and
 >  .BR hdestroy ()
 > -allow the user to create a hash table (only one at a time)
 > +allow the user to create and manipulate a hash table (only one at a time)
 >  which associates a key with any data.
 >  .PP
 > +The three functions
 > +.BR hcreate_r (),
 > +.BR hsearch_r (),
 > +.BR hdestroy_r ()
 > +are reentrant versions that allow the use of more than one table.
 > +The last argument used identifies the table.
 > +.PP
 > +.SS "hcreate()/hcreate_r()"
 > +.PP

Why do you think this is better?  I think it is better to describe the
non-reentrant functions first, and then describe the differences for
the reentrant functions.

 >  First the table must be created with the function
 > -.BR hcreate ().
 > +.BR hcreate ()
 > +/
 > +.BR hcreate_r ().
 > +.TP
 > +.B Argument "nel"

I don't really think such subdivisions of the text really help,
and they are not the norm in man-pages.  Also, you've removed the
.SH RETURN VALUE
section, which really should be present in every .2 and .3 page
(though it is currently missing from several).

 >  The argument \fInel\fP is an estimate of the maximum number of entries
 >  in the table.
 > -The function
 > -.BR hcreate ()
 > +The creation function
 >  may adjust this value upward to improve the
 >  performance of the resulting hash table.
 > -.PP
 > +.TP
 > +.B Argument "tab"
 > +As specified above, in the case of hcreate_r, this points to the
 > +table to be created.  The struct it points to must be malloc'd and

Why must it be *malloc'd*?  Surely allocation anywhere (stack, heap) will do?

Cheers,

Michael

 > +zeroed before the first call to
 > +.BR hcreate_r ().
 > +.TP
 > +.B Return Value
 > +.BR hcreate ()
 > +and
 > +.BR hcreate_r ()
 > +return 0 when allocation of the memory
 > +for the hash table fails (or, in the case of
 > +.BR hcreate(),
 > +when a hash table is already in use), non-zero otherwise.
 > +.LP
 > +.SS "hdestroy()/hdestroy_r()"
 >  The corresponding function
 >  .BR hdestroy ()
 > +/
 > +.BR hdestroy_r()
 >  frees the memory occupied by
 >  the hash table so that a new table can be constructed.
 >  .PP
 > +.SS "hsearch()/hsearch_r()"
 > +The function
 > +.BR hsearch ()
 > +searches the hash table for an
 > +item with the same key as \fIitem\fP (where "the same" is determined using
 > +.BR strcmp (3)),
 > +and if successful returns a pointer to it.
 > +.TP
 > +.B Argument "item"
 >  The argument \fIitem\fP is of type \fBENTRY\fP, which is a typedef defined in
 >  \fI<search.h>\fP and includes these elements:
 >  .in +4n
 > @@ -90,12 +129,8 @@
 >  The field \fIkey\fP points to the null-terminated string which is the
 >  search key.
 >  The field \fIdata\fP points to the data associated with that key.
 > -The function
 > -.BR hsearch ()
 > -searches the hash table for an
 > -item with the same key as \fIitem\fP (where "the same" is determined using
 > -.BR strcmp (3)),
 > -and if successful returns a pointer to it.
 > +.TP
 > +.B Argument "action"
 >  The argument \fIaction\fP determines what
 >  .BR hsearch ()
 >  does
 > @@ -103,33 +138,21 @@
 >  A value of \fBENTER\fP instructs it to
 >  insert a copy of \fIitem\fP, while a value of \fBFIND\fP means to return
 >  NULL.
 > -.PP
 > -The three functions
 > -.BR hcreate_r (),
 > -.BR hsearch_r (),
 > -.BR hdestroy_r ()
 > -are reentrant versions that allow the use of more than one table.
 > -The last argument used identifies the table.
 > -The struct it points to
 > -must be zeroed before the first call to
 > -.BR hcreate_r ().
 > -.SH "RETURN VALUE"
 > -.BR hcreate ()
 > -and
 > -.BR hcreate_r ()
 > -return 0 when allocation of the memory
 > -for the hash table fails, non-zero otherwise.
 > -.LP
 > +.TP
 > +.B Argument "ret"
 > +The argument \fIret\fP points at the found item, if action was \fBFIND\fP
 > +and there were no errors.
 > +.TP
 > +.B Return Value
 >  .BR hsearch ()
 >  returns NULL if \fIaction\fP is \fBENTER\fP and
 >  the hash table is full, or \fIaction\fP is \fBFIND\fP and \fIitem\fP
 >  cannot be found in the hash table.
 > -.LP
 >  .BR hsearch_r ()
 > -returns 0 if \fIaction\fP is \fBENTER\fP and
 > -the hash table is full, and non-zero otherwise.
 > +returns zero on failure, and non-zero on success.  If there's a failure,
 > +the error (see ERRORS section below) is stored in errno.
 >  .SH ERRORS
 > -POSIX documents
 > +POSIX documents the following errno values (#include <errno.h>):
 >  .TP
 >  .B ENOMEM
 >  Out of memory.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
