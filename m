From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Document accounting of FDs passed over UNIX domain sockets
Date: Sat, 17 Dec 2016 10:34:46 +0100
Message-ID: <5365dfbc-1506-d49f-975e-efa2ac49d002@gmail.com>
References: <68dec064-17bb-0994-8dcf-e06d54d80ada@gmail.com>
 <20161217070431.GA13141@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161217070431.GA13141-K+wRfnb2/UA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Willy Tarreau <w@1wt.eu>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tetsuo Handa <penguin-kernel-1yMVhJb1mP/7nzcFbJAaVXf5DAMn2ifp@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Willy,

On 12/17/2016 08:04 AM, Willy Tarreau wrote:
> Hi Michael,
> 
> On Fri, Dec 16, 2016 at 12:08:33PM +0100, Michael Kerrisk (man-pages) wrote:
>> Hello Willy,
>>
>> Your commit 712f4aad406bb1 ("unix: properly account for FDs passed over 
>> unix sockets" added accounting to ensure that the RLIMIT_NOFILE limit
>> could not be bypassed when passing file descriptors across UNIX
>> domain sockets.
>>
>> Such patches should be CCed to linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org ;-)
> 
> Yes, I learned this after your presentation at kernel recipes, but this
> patch pre-dates it ;-)

But the note in Documentation/SubmittingPatches predates that ;-)

>> A documentation [atch would be great as well, but I had a shot 
>> at cobbling some text together. Does the text below (for the unix(7)
>> man page) look okay?
> 
> I think so, though maybe we can arrange it very slightly given that
> this was considered as a fix for a vulnerability and backported to
> various kernels :
> 
>>        ETOOMANYREFS
>>               This  error  can  occur  for sendmsg(2) when sending a file
>>               descriptor as ancilary data over a UNIX domain socket  (see
>>               the  description  of  SCM_RIGHTS, above).  It occurs if the
>>               number  of  "in-flight"  file   descriptors   exceeds   the
>>               RLIMIT_NOFILE  resource  limit and the caller does not have
>>               the  CAP_SYS_RESOURCE  capability.    An   in-flight   file
>>               descriptor  is  one that has been sent using sendmsg(2) but
>>               has not yet been accepted in the  recipient  process  using
>>               recvmsg(2).
>>
>>               This error is diagnosed since Linux 4.5.  In earlier kernel
>>               versions, it was possible to place an unlimited  number  of
>>               file descriptors in flight, by sending each file descriptor
>>               with sendmsg(2) and then closing  the  file  descriptor  so
>>               that   it  was  not  accounted  against  the  RLIMIT_NOFILE
>>               resource limit.
> 
> -               resource limit.
> +               resource limit. Some older stable kernels might have
> +               included the same check by backporting the fix from 4.5.
> 
> I've just checked the exact versions containing this, but I don't think
> it's worth providing the list, in my opinion mentionning that it could be
> observed on some older versions is enough to help developers who see it
> in field :
>   - 3.2.78
>   - 3.10.99
>   - 3.12.57
>   - 3.14.63
>   - 3.16.35
>   - 3.18.27
>   - 4.1.19
>   - 4.4.4

Yea. This is a tricky issue that I run into now and then. I've added
some different wording that expresses they same idea you intended.
Thanks for noting this.

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
