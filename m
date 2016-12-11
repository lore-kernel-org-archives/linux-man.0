From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fuse.4: Add new file describing /dev/fuse
Date: Sun, 11 Dec 2016 10:28:37 +0100
Message-ID: <1557a45c-8282-d181-1533-0204895ddc9b@gmail.com>
References: <20161210072018.GA5267@juliacomputing.com>
 <87vaurbi7q.fsf@vostro.rath.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vaurbi7q.fsf-sKB8Sp2ER+yL2G7IJ6k9tw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikolaus Rath <Nikolaus-BTH8mxji4b0@public.gmane.org>, Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Miklos Szeredi <miklos-sUDqSbJrdHQHWmgEVkV9KA@public.gmane.org>, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/10/2016 10:13 PM, Nikolaus Rath wrote:
> Hi,
> 
> On Dec 10 2016, Keno Fischer <keno-9DCaDmOhoh+8M3too/+dENBPR1lH4CV8@public.gmane.org> wrote:
>> This is my writeup of a basic description of /dev/fuse after playing with
>> it for a few hours today. It is of course woefully incomplete, and since
>> I neither have a use case nor am working on this code, I will not be
>> in a position to expand it in the near future. However, I'm hoping this
>> could still serve as a handy reference for others looking at this interface.
> 
> That's great! It makes me wonder:
> 
> At the moment, libfuse ships a mount.fuse(8) manpage that documents both
> the mount options that can be passed to the kernel, and the pseudo-mount
> options that can be used when using libfuse (but that are actually
> implemented in userspace).
> 
> Would it make sense to remove everything kernel related from
> mount.fuse(8) and move it into linux-manpages?
> 
> Here's the manpage I'm talking about:
> https://github.com/libfuse/libfuse/blob/master/doc/mount.fuse.8

I can see pros and cons. mount(8) does a similar thing
for mount options understood by the kernel. So there is precedent
for the approach taken in mount.fuse.8

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
