From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: backtrace_symbols_fd() can trigger a call to malloc()
Date: Fri, 5 Dec 2014 19:04:02 +0200
Message-ID: <CACKs7VDrN+oz2Yi8UqFf=Zw2JufpUMFVinO3aVorPTBA6yuXyw@mail.gmail.com>
References: <CACKs7VD8DcgDBOU85uxq6R2n5sC4cAEH7cdE90Zt9EN3Of7e=g@mail.gmail.com>
	<5481CCC3.3020405@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5481CCC3.3020405-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Walter,

On Fri, Dec 5, 2014 at 5:18 PM, walter harms <wharms-fPG8STNUNVg@public.gmane.org> wrote:

>> +So you need to call
>> +.BR backtrace ()
>> +or some other libgcc function early in your program to trigger loading
>> +of libgcc in order to make sure that later calls don't trigger the
>> +indirect memory allocation (for instance when called from a signal
>> +handler).
>
> I would drop that part. there are several way to load libgcc (e.g.LD_PRELOAD).
>
> what about "make sure that libgcc is already loaded at the begining" ?
> something like that.
>
>

Yep, makes sense, thanks. New version below:

diff --git a/man3/backtrace.3 b/man3/backtrace.3
index 1b21794..0b2c6ba 100644
--- a/man3/backtrace.3
+++ b/man3/backtrace.3
@@ -114,7 +114,8 @@ it writes the strings, one per line, to the file descriptor
 .BR backtrace_symbols_fd ()
 does not call
 .BR malloc (3),
-and so can be employed in situations where the latter function might fail.
+and so can be employed in situations where the latter function might
+fail, but see NOTES.
 .SH RETURN VALUE
 .BR backtrace ()
 returns the number of addresses returned in
@@ -156,6 +157,18 @@ violated.
 Inlined functions do not have stack frames.
 .IP *
 Tail-call optimization causes one stack frame to replace another.
+.IP *
+.BR backtrace ()
+and
+.BR backtrace_symbols_fd ()
+don't call
+.BR malloc ()
+explicitly, but they are part of libgcc, which gets loaded dynamically
+when first used. Dynamic loading usually triggers a call to
+.BR malloc ().
+If you need certain calls to the 2 functions to not allocate memory
+(in signal handlers, for example), you need to make sure libgcc is
+loaded beforehand.
 .PP
 The symbol names may be unavailable without the use of special linker
 options.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
