From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Tue, 2 Apr 2013 08:54:39 +0200
Message-ID: <CAKgNAkgG2kdCC1tyZQkYU7O_nP7RB8VoCmx6eb8FcudU1s6RgA@mail.gmail.com>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com>
 <201304010429.45737.vapier@gentoo.org> <CAKgNAkij3zDwakWvcRkRbknmV2Hpt4HWfH4uVqmxp+7gQek-2g@mail.gmail.com>
 <201304010632.41520.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304010632.41520.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Apr 1, 2013 at 12:32 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On Monday 01 April 2013 05:29:11 Michael Kerrisk (man-pages) wrote:
>> On Mon, Apr 1, 2013 at 10:29 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
>> > not sure if it's worth mentioning, but this issue ends up forcing MIPS'
>> > O32 to take 7 arguments to syscall() :).  on ARM/PPC, they avoid this by
>> > reordering the arguments.
>>
>> I'm not sure that we need quite this level of detail, so I'll leave for
>> now.
>
> i only mention it because 7 args to syscall is unusual ... i thinks mips/o32
> is the only arch that does this.

I'll add a note in the page source. Maybe I'll revisit this later.

>> > on a related topic, would it be useful to document the exact calling
>> > convention for architecture system calls ?  from time to time, i need to
>> > reference this, and i inevitably turn to a variety of sources to dig up
>> > the answer (the kernel itself, or strace, or qemu, or glibc, or uClibc,
>> > or lss, or other random places).  i would find it handy to have all of
>> > these in a single location.
>>
>> Sounds like it would be useful to have that documented. Would you have
>> a chance to write patches for that?
>
> should we do it in syscall(2) ?  or a dedicated man page ?

It's a little hard to say until I see the shape of what comes. Can you
provide a rough per-syscall example or two of what you expect to
document? (Don't write too concrete a patch yet, until I can get a
handle on what you intend.)

> if the former, create a dedicated section, or do it under NOTES ?

*If* the former, then I'd say a subsection under NOTES. But maybe this
is better per-syscall. Not sure yet.

>> --- a/man2/syscall.2
>> +++ b/man2/syscall.2
>>
>> +64-bit value (e.g.,
>> +.IR "long long" ) must be aligned to an even register pair.
>
> this renders incorrectly.  the reset of the sentence should be pulled onto a
> new line.

fixed.

>> +That means inserting a dummy value into
>> +.I r1
>> +(the second argument of 0).
>> +Similar issues can occur on MIPS with the O32 ABI and
>> +on PowerPC with the 32-bit ABI.
>> +The affected system calls are
>> +.BR fadvise64_64 (2),
>> +.BR ftruncate64 (2),
>> +.BR posix_fadvise (2),
>> +.BR pread64 (2),
>> +.BR pwrite64 (2),
>> +.BR readahead (2),
>> +.BR sync_file_range (2),
>> +and
>> +.BR truncate64 (2).
>
> i'm on the fence whether this reads better if there's a new paragraph starting
> with "Similar issues", and whether the list of syscalls should be a flat list
> (one syscall per line).

Tweaked.

>> --- a/man2/posix_fadvise.2
>> +++ b/man2/posix_fadvise.2
>> @@ -153,7 +153,10 @@ or
>>  first.
>>  .SS arm_fadvise()
>>  The ARM architecture
>> -needs 64-bit arguments to be aligned in a suitable pair of registers.
>> +needs 64-bit arguments to be aligned in a suitable pair of registers
>> +(see
>> +.BR syscall (2)
>> +for further detail).
>
> probably want to scrub the arm references altogether and say "some 32-bit
> arches".  this signature is used on other arches as well (ppc and xtensa at
> least).

Tweaked.

> would also stop describing it as "flawed".  there are tradeoffs when the ABI
> imposes these kinds of requirements, and i'm not sure one is really better
> than the other.

Removed "flawed"

>> --- a/man2/sync_file_range.2
>> +++ b/man2/sync_file_range.2
>> @@ -191,6 +191,9 @@ is flawed, since it forces a register to be wasted
>> as padding between the
>>  and
>>  .I offset
>>  arguments.
>> +(See
>> +.BR syscall (2)
>> +for details.)
>>  Therefore, these architectures define a different
>>  system call that orders the arguments suitably:
>
> also in this man page, i would stop describing it as "flawed".

Done.

Changes have been pushed to Git now.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
