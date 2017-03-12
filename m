From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] syscall(2): add endian details with 64-bit splitting
Date: Sun, 12 Mar 2017 10:49:06 +0100
Message-ID: <ba50f946-6d21-dee6-3a47-b092c94f564a@gmail.com>
References: <20170311031600.717-1-vapier@gentoo.org>
 <20170311195422.3479-1-vapier@gentoo.org>
 <CABLBYvROUxy+NyDwQwDZw57KbC6igHoCKbJ6oYjA3j+rQVteEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABLBYvROUxy+NyDwQwDZw57KbC6igHoCKbJ6oYjA3j+rQVteEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Victor Khimenko <khim-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, wharms-fPG8STNUNVg@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/12/2017 05:31 AM, Victor Khimenko wrote:
> On Sat, Mar 11, 2017 at 8:54 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
>> Architectures that split 64-bit values across registers pairs usually do
>> so according to their C ABI calling convention (which means endianness).
>> Add some notes to that effect, and change the readahead example to show
>> a little endian example (since that is way more common than big endian).
>>
>> Also start a new list of syscalls that this issue does not apply to.
>>
> 
> Perfect. Thanks. Now it gives all the required pointers for someone to
> find out the needed information, Thanks.

Thanks, Victor, for your initial report and the input for this patch.

Cheers,

Michael


>> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>> ---
>> v2
>>         - add preadv/prwritev/preadv2/prwritev2 to the new list.
>>
>>  man2/syscall.2 | 22 ++++++++++++++++++++--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/man2/syscall.2 b/man2/syscall.2
>> index fcb0a7e21248..f8c89b84356d 100644
>> --- a/man2/syscall.2
>> +++ b/man2/syscall.2
>> @@ -102,13 +102,14 @@ Thus, using
>>  instead of the wrapper provided by glibc,
>>  the
>>  .BR readahead ()
>> -system call would be invoked as follows on the ARM architecture with the EABI:
>> +system call would be invoked as follows on the ARM architecture with the EABI
>> +in little endian mode:
>>
>>  .in +4n
>>  .nf
>>  syscall(SYS_readahead, fd, 0,
>> -        (unsigned int) (offset >> 32),
>>          (unsigned int) (offset & 0xFFFFFFFF),
>> +        (unsigned int) (offset >> 32),
>>          count);
>>  .fi
>>  .in
>> @@ -124,6 +125,8 @@ register pair.
>>  That means inserting a dummy value into
>>  .I r1
>>  (the second argument of 0).
>> +Care also must be taken so that the split follows endian conventions
>> +(according to the C ABI for the platform).
>>
>>  Similar issues can occur on MIPS with the O32 ABI,
>>  on PowerPC with the 32-bit ABI, and on Xtensa.
>> @@ -140,6 +143,21 @@ The affected system calls are
>>  .BR sync_file_range (2),
>>  and
>>  .BR truncate64 (2).
>> +
>> +.\" You need to look up the syscalls directly in the kernel source to see if
>> +.\" they should be in this list.  For example, look at fs/read_write.c and
>> +.\" the function signatures that do:
>> +.\" ..., unsigned long, pos_l, unsigned long, pos_h, ...
>> +.\" If they use off_t, then they most likely do not belong in this list.
>> +This does not affect syscalls that manually split and assemble 64-bit values
>> +such as
>> +.BR _llseek (2),
>> +.BR preadv (2),
>> +.BR preadv2 (2),
>> +.BR pwritev (2).
>> +and
>> +.BR pwritev2 (2).
>> +Welcome to the wonderful world of historical baggage.
>>  .SS Architecture calling conventions
>>  Every architecture has its own way of invoking and passing arguments to the
>>  kernel.
>> --
>> 2.12.0
>>
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
