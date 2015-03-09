From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: Handling of updates to kernel Documentation/ tree
Date: Mon, 9 Mar 2015 08:07:39 -0700
Message-ID: <20150309150739.GA6131@infradead.org>
References: <3421611.4D45Q2BAys@tauon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3421611.4D45Q2BAys@tauon>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Cc: Michael Kerrisk <michael.kerrisk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Mar 09, 2015 at 03:17:58PM +0100, Stephan Mueller wrote:
> Hi Michael,
> 
> how shall an update to the Documentation/ tree be handled in man pages 
> that contain a pointer to these documents?
> 
> Specifically, socket(2) contains a reference to 
> Documentation/crypto/crypto-API-userspace.txt. With the patch [1] the 
> document is gone and its contents is moved into a DocBook.
> 
> Shall the kernel DocBook website [2] be referenced? If so, when is it 
> appropriate to add the patch (note, the change is expected to be 
> propagated to Linus' tree in 4.1-rc1).

Referencing a kernel Documentation file from a man page sounds like
a bad idea to me.  Why can't we include a nroff-yfied version of the
content in the man-pages repository?
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
