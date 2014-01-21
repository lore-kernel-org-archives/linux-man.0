From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open: Document O_TMPFILE
Date: Tue, 21 Jan 2014 07:07:02 +0100
Message-ID: <52DE0E86.2040006@gmail.com>
References: <3bec865ec3205e23c997ddc2c9bbacf0e53b0d18.1375896634.git.luto@amacapital.net> <52DD1BF5.6080502@gmail.com> <CALCETrUXKCZi0rPW7jLdH9fZ-cv3L1AaejGB=FmA3TFK3Y+NGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALCETrUXKCZi0rPW7jLdH9fZ-cv3L1AaejGB=FmA3TFK3Y+NGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/21/2014 01:14 AM, Andy Lutomirski wrote:
> On Mon, Jan 20, 2014 at 4:52 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 08/07/2013 07:31 PM, Andy Lutomirski wrote:
>>> O_TMPFILE is new in Linux 3.11
>>
>> Thanks, Andy. I've applied your patch. I also added the following
>> errors under ERRORS. Do they look okay to you?
>>
>>        EINVAL O_TMPFILE  was  specified in flags, but neither O_WRONLY
>>               nor O_RDWR was specified.
>>
>>        EISDIR O_TMPFILE  and  one of O_WRONLY or O_RDWR were specified
>>               in flags, but this kernel version does not  provide  the
>>               O_TMPFILE functionality.
> 
> I suspect that EISDIR only happens if the directory exists and is
> accessible (matching the flags).  

Good point.

> Otherwise EACCES and ENOENT sound
> plausible.

Testing on older kernels, with a directory that has no permissions 
available, and a nonexistent directory, it looks like only ENOENT
comes into play (i.e., the EISDIR check is made before the EACCES 
check). So I'll add the following:

       ENOENT pathname  refers  to  a nonexistent directory, O_TMPFILE
              and one of O_WRONLY or O_RDWR were specified  in  flags,
              but  this  kernel version does not provide the O_TMPFILE
              functionality.

Look okay?

> Sigh.  Why wasn't this implemented as a brand new syscall?

Hmmm? You think it's a problem that a user of O_TMPFILE has to check for
two different error codes to see if the flag is unsupported by the kernel?

</irony>

Yes, it's a mess. Presumably, things were done this way because
other open() flags--e.g., O_CLOEXEC, O_APPEND, O_SYNC)
could be meaningfully used with tmpfiles. But it would, I imagine,
have been possible to implement those flags in a separate syscall
with some suitable refactoring to handle the pieces common to open().
I can't help but wonder if this abuse of the interface will come
back to bite us some time.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
