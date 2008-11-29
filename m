From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: Query about uname.
Date: Sat, 29 Nov 2008 08:08:43 -0500
Message-ID: <cfd18e0f0811290508m6bec0b6at173f2f282a924e61@mail.gmail.com>
References: <200811270735.42064.rob@landley.net>
	 <cfd18e0f0811281300r6a487be9p6f0fbc1175bfd1a0@mail.gmail.com>
	 <200811290207.27989.rob@landley.net>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <200811290207.27989.rob@landley.net>
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
To: Rob Landley <rob@landley.net>
Cc: linux-doc@vger.kernel.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

[CC+= linux-msan@, which is where man-pages discussions really belong...]

On Sat, Nov 29, 2008 at 3:07 AM, Rob Landley <rob@landley.net> wrote:
> On Friday 28 November 2008 15:00:23 Michael Kerrisk wrote:
>> Rob,
>>
>> On Thu, Nov 27, 2008 at 8:35 AM, Rob Landley <rob@landley.net> wrote:
>> > http://kernel.org/doc/man-pages/online/pages/man2/uname.2.html
>> >
>> > It says the length of the fields was unspecified.
>>
>> Yup -- that's what POSIX says.
>
> Posix doesn't specify init or mount either.  "Posix doesn't specify" doesn't
> forbid something else from specifying it.

I think you somewhat misunderstand "unspecified".  For a wise
application writer, this means: avoid relying on specific behaviors
here if you want to write portable and future-proof programs.

>> As noted in the first para of the description,
>> the fields of the structure are null-terminated, which, in the typical
>> case, makes it quite possible to use them without knowing their
>> (maximum) lengths.
>
> Use a field, yes.  Iterate though the fields/find the next field, no.

(This strikes me as a somewhat unusual requirement in the context of uname())

> (I
> suppose you can memset the memory block you feed to the syscall to "null" and
> iterate through to the next non-null character, as long there's a guarantee
> none of the fields will be zero length.)
>
>> And indeed, a portable program should not care.
>
> When I start writing portable programs that I intend to support on Dragonfly
> BSD, I'll let you know.  "Posix portable" includes Windows NT and strange IBM
> mainframes.

Sure, but the man-pages are written for a general audience, many of
whom most certainly *do* care about portability.

>> > so leaving it unspecified is silly.  It's part of the current kernel's
>> > binary abi, and the value is currently 65.
>>
>> And that last piece is exactly part of the problem, because once upon
>> a time (okay: a long time ago, now), it was true that "the value is
>> currently 9".
>>
>> It seems to me that all the info you needed was there in the page, but
>> you didn't read the whole page.
>
> True.  I didn't notice that there was a "notes" field (my screen ended with
> "return value", "errors", and "conforming to", didn't hit page down) that was
> larger than the rest of the page.  My bad.
>
>> The question is, whether the page
>> could/should provide more clues to make sure that the reader is
>> pointed to the fine details (which, for the reasons I described above,
>> are often not needed).
>
> I thought the point of the man pages on kernel.org was to document the kernel
> API.

See http://www.kernel.org/doc/man-pages/

And especially, have a good look at
http://www.kernel.org/doc/man-pages/maintaining.html

Man-pages serves many purposes -- a probably incomplete list, in no
particular order:

1.Documenting the kernel API
2. Documenting the glibc API
3. Managing the sometimes tricky balance between the first two goals
when there is a glibc wrapper that is non-trivial and changes the
interface of the underlying system call.
4. Providing guidance on writing programs portable across Unix systems.
5. Providing information on historical variations in the Linux kernel
and glibc interfaces -- in other words, providing guidance for
programmers writing programs portable across Linux kernel and glibc
versions.

> (If you're programming against glibc I assume that has its own
> documentation somewhere.)

An interesting surmise.  There is the glibc manual.  But

1. Many people (greatly) prefer man(1) format
2. The glibc manual is far from complete.  (Often there is a man page
for a glibc function, but no info page; sometimes the reverse is also
true.)
3. The glibc manual often doesn't seem to cover details of historical
changes in the glibc interface, or to document bugs.
4. Oftentimes a function's man page is better (more info, and/or a
better (or any) example program) than the glibc info page (sometimes,
the reverse is true, but often that changes after I find out about
it).

> I suppose those of us programming against uClibc or
> other low level interfaces can always just look at the kernel source code.

(Not sure of where you mean to go with that statement.)

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
