From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: Query about uname.
Date: Sun, 30 Nov 2008 22:41:09 -0500
Message-ID: <cfd18e0f0811301941g5a71e8do507bba3567d043d8@mail.gmail.com>
References: <200811270735.42064.rob@landley.net>
	 <200811290207.27989.rob@landley.net>
	 <cfd18e0f0811290508m6bec0b6at173f2f282a924e61@mail.gmail.com>
	 <200811301927.27969.rob@landley.net>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <200811301927.27969.rob@landley.net>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Sun, Nov 30, 2008 at 8:27 PM, Rob Landley <rob@landley.net> wrote:
> On Saturday 29 November 2008 07:08:43 Michael Kerrisk wrote:
>> [CC+= linux-msan@, which is where man-pages discussions really belong...]
>
> I wonder what linux-doc is for?

Something else.

>> > Posix doesn't specify init or mount either.  "Posix doesn't specify"
>> > doesn't forbid something else from specifying it.
>>
>> I think you somewhat misunderstand "unspecified".  For a wise
>> application writer, this means: avoid relying on specific behaviors
>> here if you want to write portable and future-proof programs.
>
> Perhaps I'm strange in trying to treat Linux as a platform I want to write
> software for.  I'm all for future-proofing, but after a binary's compiled
> there's not a whole lot you can do about it,

Untrue.  There are often things you can do *before* the binary is
compiled, so as to avoid relying on unspecified details.

[...]

>> >> And indeed, a portable program should not care.
>> >
>> > When I start writing portable programs that I intend to support on
>> > Dragonfly BSD, I'll let you know.  "Posix portable" includes Windows NT
>> > and strange IBM mainframes.
>>
>> Sure, but the man-pages are written for a general audience, many of
>> whom most certainly *do* care about portability.
>
> As long as that general audience doesn't _exclude_ people who think that Linux
> is a platform in its own right,

I'm not sure where this idea of yours even comes from?  It's certainly
not the intent of man-pages...

[...]

>> >> It seems to me that all the info you needed was there in the page, but
>> >> you didn't read the whole page.
>> >
>> > True.  I didn't notice that there was a "notes" field (my screen ended
>> > with "return value", "errors", and "conforming to", didn't hit page down)
>> > that was larger than the rest of the page.  My bad.
>> >
>> >> The question is, whether the page
>> >> could/should provide more clues to make sure that the reader is
>> >> pointed to the fine details (which, for the reasons I described above,
>> >> are often not needed).
>> >
>> > I thought the point of the man pages on kernel.org was to document the
>> > kernel API.
>>
>> See http://www.kernel.org/doc/man-pages/
>>
>> And especially, have a good look at
>> http://www.kernel.org/doc/man-pages/maintaining.html
>
> I read the first five screens full, and skimmed the first three pages of the
> first link (man 7 man-pages).  I assume there's a policy statement buried
> somewhere under there, but didn't dig far enough to find it.
>
> I was under the impression that man page section 2 was about the kernel, and
> man page section 3 was about glibc.

Life is not so simple, because of (g)libc wrappers.

>> Man-pages serves many purposes -- a probably incomplete list, in no
>> particular order:
>>
>> 1.Documenting the kernel API
>> 2. Documenting the glibc API
>> 3. Managing the sometimes tricky balance between the first two goals
>> when there is a glibc wrapper that is non-trivial and changes the
>> interface of the underlying system call.
>
> I'm aware of this.  I thought the kernel.org pages would document the kernel,
> because glibc has its own documentation and nothing else is going to.  If it
> wants to document how glibc does things as well, I'd like to if people using
> klibc or uClibc or dietlibc or newlib or one of the others had at least the
> capability to distinguish and ignore it.

Ideally (the pages in man-pages are not perfect), this capability
exists.  If you look in section 2 pages, you'll *often* see notes that
point out what's added to the kernel by glibc.

> Glibc isn't the only C library used
> on Linux.

But it is the one used by the overwhelming majority of applications.

>> 4. Providing guidance on writing programs portable across Unix systems.
>
> SUSv3 is available online:
> http://www.opengroup.org/onlinepubs/009695399/
> http://www.opengroup.org/onlinepubs/009695399/idx/xsh_chap02.html
> http://www.opengroup.org/onlinepubs/009695399/idx/functions.html
>
> When I want "portable", I look there.

Good for you.

>> 5. Providing information on historical variations in the Linux kernel
>> and glibc interfaces -- in other words, providing guidance for
>> programmers writing programs portable across Linux kernel and glibc
>> versions.
>
> Sure.  As a computer history buff, I'm all for it.
>
> As a programmer, it's not usually what I'm looking for when I open a man page,
> and if I wanted to look at Red Hat 7's man pages I have
> http://archive.download.redhat.com and qemu...

Maybe you don't; some programmers do though.

>> > (If you're programming against glibc I assume that has its own
>> > documentation somewhere.)
>>
>> An interesting surmise.  There is the glibc manual.  But
>>
>> 1. Many people (greatly) prefer man(1) format
>> 2. The glibc manual is far from complete.  (Often there is a man page
>> for a glibc function, but no info page; sometimes the reverse is also
>> true.)
>> 3. The glibc manual often doesn't seem to cover details of historical
>> changes in the glibc interface, or to document bugs.
>> 4. Oftentimes a function's man page is better (more info, and/or a
>> better (or any) example program) than the glibc info page (sometimes,
>> the reverse is true, but often that changes after I find out about
>> it).
>
> Doing the whole codependent enabler thing and compensating for deficiencies

Okay -- at this point your tone is starting to grate (more).  By your
own admission, you are unaware of many details of the origins, goals,
and operation of the man-pages project.  If you have specific
suggestions on how to improve specific pages, send them,  So far,
mostly it looks like you are arm waving, and, by now, starting to get
disrespectful with it.  If you want to offer suggestions or advice
about what the project does, or should do, they'll be much better
received if you first educate yourself about the project and why it
does things the way it does.

[...]

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
