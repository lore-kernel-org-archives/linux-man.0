From: Rob Landley <rob@landley.net>
Subject: Re: Query about uname.
Date: Sun, 30 Nov 2008 19:27:27 -0600
Message-ID: <200811301927.27969.rob@landley.net>
References: <200811270735.42064.rob@landley.net> <200811290207.27989.rob@landley.net> <cfd18e0f0811290508m6bec0b6at173f2f282a924e61@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cfd18e0f0811290508m6bec0b6at173f2f282a924e61@mail.gmail.com>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: mtk.manpages@gmail.com
Cc: linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Saturday 29 November 2008 07:08:43 Michael Kerrisk wrote:
> [CC+= linux-msan@, which is where man-pages discussions really belong...]

I wonder what linux-doc is for?

> > Posix doesn't specify init or mount either.  "Posix doesn't specify"
> > doesn't forbid something else from specifying it.
>
> I think you somewhat misunderstand "unspecified".  For a wise
> application writer, this means: avoid relying on specific behaviors
> here if you want to write portable and future-proof programs.

Perhaps I'm strange in trying to treat Linux as a platform I want to write 
software for.  I'm all for future-proofing, but after a binary's compiled 
there's not a whole lot you can do about it, and if they're happy to break 
binary compatibility all bets are off anyway.

> >> As noted in the first para of the description,
> >> the fields of the structure are null-terminated, which, in the typical
> >> case, makes it quite possible to use them without knowing their
> >> (maximum) lengths.
> >
> > Use a field, yes.  Iterate though the fields/find the next field, no.
>
> (This strikes me as a somewhat unusual requirement in the context of
> uname())

Implementing "uname -a", or having uname's command line argument parsing that 
treats "snrvm" as a series of fields in order.

> >> And indeed, a portable program should not care.
> >
> > When I start writing portable programs that I intend to support on
> > Dragonfly BSD, I'll let you know.  "Posix portable" includes Windows NT
> > and strange IBM mainframes.
>
> Sure, but the man-pages are written for a general audience, many of
> whom most certainly *do* care about portability.

As long as that general audience doesn't _exclude_ people who think that Linux 
is a platform in its own right, and that just as some MacOS X programs won't 
run on Linux, it's perfectly acceptable for a Linux program to open 
/proc/cpuinfo and look at its contents if they've been stable for over 10 
years now and there's no other obvious way to get that info.


> >> It seems to me that all the info you needed was there in the page, but
> >> you didn't read the whole page.
> >
> > True.  I didn't notice that there was a "notes" field (my screen ended
> > with "return value", "errors", and "conforming to", didn't hit page down)
> > that was larger than the rest of the page.  My bad.
> >
> >> The question is, whether the page
> >> could/should provide more clues to make sure that the reader is
> >> pointed to the fine details (which, for the reasons I described above,
> >> are often not needed).
> >
> > I thought the point of the man pages on kernel.org was to document the
> > kernel API.
>
> See http://www.kernel.org/doc/man-pages/
>
> And especially, have a good look at
> http://www.kernel.org/doc/man-pages/maintaining.html

I read the first five screens full, and skimmed the first three pages of the 
first link (man 7 man-pages).  I assume there's a policy statement buried 
somewhere under there, but didn't dig far enough to find it.

I was under the impression that man page section 2 was about the kernel, and 
man page section 3 was about glibc.

> Man-pages serves many purposes -- a probably incomplete list, in no
> particular order:
>
> 1.Documenting the kernel API
> 2. Documenting the glibc API
> 3. Managing the sometimes tricky balance between the first two goals
> when there is a glibc wrapper that is non-trivial and changes the
> interface of the underlying system call.

I'm aware of this.  I thought the kernel.org pages would document the kernel, 
because glibc has its own documentation and nothing else is going to.  If it 
wants to document how glibc does things as well, I'd like to if people using 
klibc or uClibc or dietlibc or newlib or one of the others had at least the 
capability to distinguish and ignore it.  Glibc isn't the only C library used 
on Linux.

> 4. Providing guidance on writing programs portable across Unix systems.

SUSv3 is available online:
http://www.opengroup.org/onlinepubs/009695399/
http://www.opengroup.org/onlinepubs/009695399/idx/xsh_chap02.html
http://www.opengroup.org/onlinepubs/009695399/idx/functions.html

When I want "portable", I look there.

> 5. Providing information on historical variations in the Linux kernel
> and glibc interfaces -- in other words, providing guidance for
> programmers writing programs portable across Linux kernel and glibc
> versions.

Sure.  As a computer history buff, I'm all for it.

As a programmer, it's not usually what I'm looking for when I open a man page, 
and if I wanted to look at Red Hat 7's man pages I have 
http://archive.download.redhat.com and qemu...

> > (If you're programming against glibc I assume that has its own
> > documentation somewhere.)
>
> An interesting surmise.  There is the glibc manual.  But
>
> 1. Many people (greatly) prefer man(1) format
> 2. The glibc manual is far from complete.  (Often there is a man page
> for a glibc function, but no info page; sometimes the reverse is also
> true.)
> 3. The glibc manual often doesn't seem to cover details of historical
> changes in the glibc interface, or to document bugs.
> 4. Oftentimes a function's man page is better (more info, and/or a
> better (or any) example program) than the glibc info page (sometimes,
> the reverse is true, but often that changes after I find out about
> it).

Doing the whole codependent enabler thing and compensating for deficiencies 
glibc's own documentation so they don't feel the need to is fine, but if it 
gets in the way of documenting the actual kernel system calls in section 2, I 
personally find the result less useful.

I try not to criticize the work of volunteers, I just sent the original email 
to point out that the documentation hadn't proved useful for _me_.  That 
turned out to be because my screen ended at what seemed like the end of the 
documentation, and I didn't hit page down to make sure.  My mistake.

> > I suppose those of us programming against uClibc or
> > other low level interfaces can always just look at the kernel source
> > code.
>
> (Not sure of where you mean to go with that statement.)

What I meant is that if section 2 man pages prefer to document some glibc 
wrapper rather than the actual kernel interface, if all else fails I can 
always look at the kernel's source code to see what interface the kernel 
actually exposes to userspace.

I occasionally run a program built against glibc under strace to see what 
system call it's making and what parameters are passed into that call, then 
look at the kernel source code to see what function that gets dispatched to 
and what it does with those arguments.  I really really really prefer not to 
do this, but if all else fails it's a useful debugging trick.

I can also look at the glibc headers, which is good for most system calls.  (I 
have yet to bother looking at the glibc source code.)

In this case, the information was documented, I just didn't see it.  As I 
said, my bad for not knowing that a page ending with:

> RETURN VALUE
>        On  success,  zero is returned.  On error, -1 is returned, and errno
> is set appropriately.
>
> ERRORS
>        EFAULT buf is not valid.
>
> CONFORMING TO
>        SVr4, POSIX.1-2001.  There is no uname() call in 4.3BSD.

Was not actually the end of the page, but that if I paged down there were 
"notes", "see also", and "colophon" sections.  (Idiosyncrasy of the way "less" 
works on Ubuntu; if you scroll down to the end of the page it then says you're 
on line "1/90 28%", but until you've scrolled to the end it won't do any 
readahead to figure out how much is left, so it looks like there isn't any.  
Learn something new every day...)

Rob
