From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fts.3 is not available in LFS builds
Date: Wed, 19 Mar 2014 14:29:12 +0100
Message-ID: <53299BA8.1070206@gmail.com>
References: <20140315135416.GA10430@infradead.org> <20140317140616.GA15958@infradead.org> <CAKgNAkinnsvoXT_FNxaS7L5Umo6va8OCVnTv-gZ5vvVSFi2--w@mail.gmail.com> <10506751.CXtlUKOUPc@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10506751.CXtlUKOUPc@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/19/2014 04:12 AM, Mike Frysinger wrote:
> On Mon 17 Mar 2014 15:11:18 Michael Kerrisk wrote:
>> On Mon, Mar 17, 2014 at 3:06 PM, Christoph Hellwig wrote:
>>> On Mon, Mar 17, 2014 at 03:02:53PM +0100, Michael Kerrisk wrote:
>>>> Oh! I thought most distributors built their 32-bit distros with
>>>> -D_FILE_OFFSET_BITS=64 these days? Am I wrong? (I don't have any
>>>> 32-bit systems handy to sample from.)
>>>
>>> I think some build systems try to enforce it, but last time Eric Sandeen
>>> checked we still had lots of packages not picking it up.
>>
>> Okay. I trimmed it back close to your original text:
>>
>>     BUGS
>>        All  of  the  APIs described in this man page are not safe when
>>        compiling a program using the LFS APIs on 32-bit systems (e.g.,
>>        when compiling with -D_FILE_OFFSET_BITS=64).
>>
>> (Okay?)
> 
> not to throw a wrench in there as a pedantic a$$hole, but i find the classic 
> concept of "32-bit and 64-bit systems" to not really fit into modern world 
> (well, it's been this way for much longer, so let's say "mainstream").
> 
> would you call all ILP32 ABIs 32-bit ?  e.g. mips' n32 or x86's x32.  
> sizeof(long) == 4, but sizeof(off_t) == 8.  POSIX describes these as "ILP32 
> OFF64" while the classic 32-bit systems are "ILP32 OFF".
> 
> you can (afaik) use -D_FILE_OFFSET_BITS=64 w/x32 and fts.h and have it work.  
> maybe we just ignore the issue since fts.h is dead anyways ?  just add a 
> section to the fts(3) page recommending people use ftw(3) instead ?

Okay, already ;-). I removed the words "on 32-bit systems".


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
