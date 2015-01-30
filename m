From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH manpages 2/2] arch_prctl.2, set_thread_area.2, get_thread_area.2:
 Improve TLS documentation
Date: Fri, 30 Jan 2015 16:18:22 +0100
Message-ID: <54CBA0BE.9000309@gmail.com>
References: <cover.1422568013.git.luto@amacapital.net> <eea75b78032d04f45ba1f33626b26f6b4f5c8ca3.1422568013.git.luto@amacapital.net> <54CB802E.3050806@gmail.com> <CALCETrXK+GRN2uhfJJcYcbO1T3mruRyer3XMCYYJGNkinCjwbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALCETrXK+GRN2uhfJJcYcbO1T3mruRyer3XMCYYJGNkinCjwbA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/30/2015 03:45 PM, Andy Lutomirski wrote:
> On Jan 30, 2015 8:59 AM, "Michael Kerrisk (man-pages)"
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Hi Andy,
>>
>> Thanks for this!
>>
>> I've merged this into a branch and done some light editing.
>> A few questions below.
>>
>> On 01/29/2015 10:47 PM, Andy Lutomirski wrote:
>>> The documentation for set_thread_area was very vague.  This improves
>>> it, accounts for recent kernel changes, and merges it with
>>> get_thread_area.2.
>>
>> (Yep, merging seems a good idea.)
>>>
>>> While I'm at it, clarify the related arch_prctl.2 man page.
>>>
>>> Signed-off-by: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
>>> ---
>>>  man2/arch_prctl.2      | 22 +++++++-----
>>>  man2/get_thread_area.2 | 58 +------------------------------
>>>  man2/set_thread_area.2 | 93 ++++++++++++++++++++++++++++++++++++++++++++++----
>>>  3 files changed, 102 insertions(+), 71 deletions(-)
>>>
>>> diff --git a/man2/arch_prctl.2 b/man2/arch_prctl.2
>>> index a3ab2b566915..c89fa3c7b744 100644
>>> --- a/man2/arch_prctl.2
>>> +++ b/man2/arch_prctl.2
>>> @@ -114,27 +114,33 @@ The 64-bit base changes when a new 32-bit segment selector is loaded.
>>>  is disabled in some kernels.
>>>
>>>  Context switches for 64-bit segment bases are rather expensive.
>>> -It may be a faster alternative to set a 32-bit base using a
>>> -segment selector by setting up an LDT with
>>> -.BR modify_ldt (2)
>>> -or using the
>>> +As an optimization, if a 32-bit TLS base address is used,
>>> +.BR arch_prctl (2)
>>> +may use a real TLS entry as if
>>>  .BR set_thread_area (2)
>>> -system call in kernel 2.5 or later.
>>> -.BR arch_prctl ()
>>> -is needed only when you want to set bases that are larger than 4GB.
>>> +had been called instead of manipulating the segment base register directly.
>>>  Memory in the first 2GB of address space can be allocated by using
>>>  .BR mmap (2)
>>>  with the
>>>  .B MAP_32BIT
>>>  flag.
>>>
>>> +As a result, using
>>
>> Something doesn't quite flow here. "As a result" *of what*? Should this rather
>> be something like:
>>
>>     Because of the aforementioned optimization, using
> 
> Sure.

Changed.

>>> +.BR arch_prctl (2)
>>> +and
>>> +.BR set_thread_area (2)
>>> +in the same thread is dangerous, as they may overwrite each other's
>>> +TLS entries.
>>> +
>>>  As of version 2.7, glibc provides no prototype for
>>>  .BR arch_prctl ().
>>>  You have to declare it yourself for now.
>>>  This may be fixed in future glibc versions.
>>>
>>>  .I FS
>>> -may be already used by the threading library.
>>> +may be already used by the threading library.  Glibc programs that use
>>
>> What is a "Glibc program"?
> 
> A program that links against glibc.  Maybe that should just say "Programs".


Okay /S/Glibc programs/Programs/

> The idea I'm trying to get across is that using ARCH_SET_FS for
> private purposes is a bad idea, since your threading library
> (glibc/libpthread) is very likely to use ARCH_SET_FS for its own
> purposes.  ARCH_SET_GS, on the other hand, is more likely to be
> available for private use.
> 
> This is most relevant for programs written for the purpose of testing
> arch_prctl -- using ARCH_SET_FS following by calling any glibc
> function is very likely to segfault.

(Okay.)

[...]

>>> diff --git a/man2/get_thread_area.2 b/man2/get_thread_area.2
>>> index 08589e413cc4..a03fe54fb08e 100644
>>> --- a/man2/set_thread_area.2
>>> +++ b/man2/set_thread_area.2
>>>  .IR Note :
>>>  There is no glibc wrapper for this system call; see NOTES.
>>>  .SH DESCRIPTION
>>> +Linux dedicates three global descriptor table (GDT) entries for
>>> +thread-local storage.  For more information about the LDT, see the
>>
>> s/LDT/GDT? in the previous line, right?
> 
> Yes.

Fixed.

>>> +Intel Software Developer's Manual or the AMD Architecture Programming Manual.
>>> +
>>> +.BR get_thread_area ()
>>> +reads the GDT entry indicated by
>>> +.I u_info\->entry_number
>>> +and fills in the rest of the fields in
>>> +.I u_info.
>>> +
>>>  .BR set_thread_area ()
>>> -sets an entry in the current thread's thread-local storage (TLS) array.
>>> +sets a TLS entry in the GDT.
>>> +.PP
>>>  The TLS array entry set by
>>>  .BR set_thread_area ()
>>>  corresponds to the value of
>>> @@ -27,7 +56,7 @@ corresponds to the value of
>>>  passed in by the user.
>>>  If this value is in bounds,
>>>  .BR set_thread_area ()
>>> -copies the TLS descriptor pointed to by
>>> +writes the TLS descriptor pointed to by
>>>  .I u_info
>>>  into the thread's TLS array.
>>>  .PP
>>> @@ -35,12 +64,29 @@ When
>>>  .BR set_thread_area ()
>>>  is passed an
>>>  .I entry_number
>>> -of \-1, it uses a free TLS entry.
>>> +of \-1, it finds a free TLS entry.
>>
>> s/finds/searched for/ ?
> 
> How about "searches for"?

D'oh! That's what I meant. Changed.

[...]

>>> +.SH BUGS
>>> +On 64-bit kernels before Linux 3.19, one of the padding bits in
>>
>> Was that commit e30ab185c490e9a9381385529e0fd32f0a399495 ?
> 
> Yes.

Okay.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
