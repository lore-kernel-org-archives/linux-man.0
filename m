From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Handling of updates to kernel Documentation/ tree
Date: Tue, 10 Mar 2015 06:56:40 +0100
Message-ID: <54FE8798.2050104@gmail.com>
References: <3421611.4D45Q2BAys@tauon> <20150309150739.GA6131@infradead.org> <20150309174057.GC12857@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150309174057.GC12857@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, Michael Kerrisk <michael.kerrisk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/09/2015 06:40 PM, Mike Frysinger wrote:
> On 09 Mar 2015 08:07, Christoph Hellwig wrote:
>> On Mon, Mar 09, 2015 at 03:17:58PM +0100, Stephan Mueller wrote:
>>> how shall an update to the Documentation/ tree be handled in man pages 
>>> that contain a pointer to these documents?
>>>
>>> Specifically, socket(2) contains a reference to 
>>> Documentation/crypto/crypto-API-userspace.txt. With the patch [1] the 
>>> document is gone and its contents is moved into a DocBook.
>>>
>>> Shall the kernel DocBook website [2] be referenced? If so, when is it 
>>> appropriate to add the patch (note, the change is expected to be 
>>> propagated to Linus' tree in 4.1-rc1).
>>
>> Referencing a kernel Documentation file from a man page sounds like
>> a bad idea to me.  Why can't we include a nroff-yfied version of the
>> content in the man-pages repository?
> 
> isn't that way worse ?  now we have to keep the man pages git repo in sync with 
> the kernel Documentation/ subtree.

Agreed. Unless it's totally automated, keeping things in synch is too 
painful.

> i think having the man pages refer to the public docbook kernel.org pages should 
> be fine.

It's acceptable, IMO, though proper installed documentation is better.

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
