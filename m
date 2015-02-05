From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: statfs.2: f_spare[4]  or f_spare[5]
Date: Thu, 05 Feb 2015 10:39:50 +0100
Message-ID: <54D33A66.1080908@gmail.com>
References: <5453FE6F.3010501@redhat.com> <20141101035621.GH26840@vapier.wh0rd.info> <5454CB4C.6000805@redhat.com> <20141101153635.GB21263@vapier.wh0rd.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141101153635.GB21263-eAEk4k+vi/E8xmjh+jFwDmGXanvQGlWp@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC += Rich Felker]

On 11/01/2014 04:36 PM, Mike Frysinger wrote:
> On 01 Nov 2014 13:00, Jan Chaloupka wrote:
>> On 11/01/2014 04:56 AM, Mike Frysinger wrote:
>>> On 31 Oct 2014 22:26, Jan Chaloupka wrote:
>>>> there is probably a wrong number in description of statfs structure. In
>>>> description section, struct statfs contains as a last field f_spare[5].
>>>> But the /usr/include/bits/statfs.h itself contains f_spare[4]
>>>> (glibc-headers-2.18 on f20).
>>>>
>>>> Looking into glibc-2.20, there is f_spare[6]. Looks like the structure
>>>> is gradually evolving :).
>>>>
>>>> Inspecting upstream history (gitk statfs.h), it shows it was f_spare[6]
>>>> since 1997.
>>> i wonder if we should strip f_spare from the man page.  it's not really useful.
>>
>> I would prefer to keep f_spare.
> 
> why ?  it serves no useful purpose, and people should be including the header to 
> get the definition.  the man page is there to describe the fields that actually 
> get used.

I think there's value in letting the reader know that there's more to the
structure than meets the eye. But, the clue should be more vague. I've made this

               __fsword_t f_spare[xxx];
                                 /* Padding bytes reserved for future use */

 
>> As Siddhesh wrote, statfs.h is architecture/OS dependent in general. In 
>> a case of fedora (f20, f22) armv7hl, x86_64 and i686 has f_spare[4].
>>
>> We could add a sentence right under struct statfs:
>> "Depending on your architecture or OS, length of f_spare of statfs 
>> struct can vary."
> 
> this man page is Linux specific

(True, but the point about architecture dependence still holds.)

>>> the __SWORD_TYPE should probably be replaced with __fsword_t, and drop the
>>> __WORDSIZE logic.  that gets ugly with syscall ABIs.
>>
>>   I am not sure if __SWORD_TYPE is no longer valid type and is replace 
>> by __fsword_t everywhere (all architectures and OS).
> 
> the latest headers use __fsword_t

So, I've changed dropped __WORDSIZE logc and the structure definition 
currently reads:

   struct statfs {
       __fsword_t f_type;    /* Type of filesystem (see below) */
       __fsword_t f_bsize;   /* Optimal transfer block size */ 
       fsblkcnt_t f_blocks;  /* Total data blocks in filesystem */
       fsblkcnt_t f_bfree;   /* Free blocks in filesystem */
       fsblkcnt_t f_bavail;  /* Free blocks available to
                                unprivileged user */ 
       fsfilcnt_t f_files;   /* Total file nodes in filesystem */
       fsfilcnt_t f_ffree;   /* Free file nodes in filesystem */
       fsid_t     f_fsid;    /* Filesystem ID */
       __fsword_t f_namelen; /* Maximum length of filenames */
       __fsword_t f_frsize;  /* Fragment size (since Linux 2.6) */ 
       __fsword_t f_flags;   /* Mount flags of filesystem
                                (since Linux 2.6.36) */
       __fsword_t f_spare[xxx];
                         /* Padding bytes reserved for future use */
   };

Rich Felker a while back also wrote about problems in the man page:
http://thread.gmane.org/gmane.linux.man/6749

[[
The man page for statfs(2) is using macros which are glibc
implementation internals (not part of the public interface) for
defining struct statfs. This leads programmers to believe they should
use these macros in applications (a cast to __SWORD_TYPE has recently
appeared in util-linux; see link [1] below) and __SWORD_TYPE isn't
even the correct type on glibc/x32.

Note that glibc also has the signedness of these members wrong; in the
kernel, they're rightfully unsigned for 32-bit and only signed on
64-bit (where it doesn't matter). musl does not have this mismatch; we
use unsigned types where they make sense (e.g. storing unsigned
filesystem magic numbers that don't fit in signed 32-bit).

Since the types of these fields are such a mess, I think the man page
should refrain from documenting specific types, and should include
advice on safe usage, including how to safely compare f_type -- on
glibc, the value will wrongly be negative for many filesystems, and
although default integer promotions will fix this for direct
comparison with the fs magic constants, the safe way to use f_type
seems to be explicitly casting it to uint32_t.
]]

So, this all seems a glibc mess to me. However,perhaps I'm not 
understanding something. What is the glibc expectation, regarding 
how people should work with these fields? I mean, suppose one wants
to copy one of the __fsword_t to a local variable, what type is
one supposed to do? What I'd kind of hope for is publicly export
system data(s). But lacking that, what does one do? It appears
that "unsigned int" should do the job. What about the following 
text for the man page:

    The  __fsword_t  type  used  for  various  fields in the statfs
    structure definition is a glibc internal type, not intended for
    public use.  This leaves the programmer in a bit of a conundrum
    when trying to copy or compare these fields to local  variables
    in  a  program.  Using unsigned int for such variables suffices
    on most systems.

?

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
