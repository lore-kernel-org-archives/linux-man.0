From: Simon Paillard <simon.paillard-w8Qkl7EtMQc@public.gmane.org>
Subject: Re: [PATCH] minor typo fixes in several pages
Date: Wed, 31 Jul 2013 00:29:43 +0200
Message-ID: <20130730222943.GC16192@mraw.org>
References: <CALhU9tkjN=EBf0QBOzOV1exsER_fRxZSVgvh2c869D92NDonoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALhU9tkjN=EBf0QBOzOV1exsER_fRxZSVgvh2c869D92NDonoQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Jul 31, 2013 at 05:34:32AM +0900, Akihiro MOTOKI wrote:
> I found typos in several pages from LDP man-pages 3.52.
> 
> _syscall.2
> popen.3
> tempnam.3
> bootparam.7
> socket.7
> 
> Is it better to split a patch per page?

Seen on https://www.kernel.org/doc/man-pages/patches.html :
* Send logically separate patches (e.g., for unrelated pages, or for logically
  separate issues in the same page) as separate mails. 

But you should work against the git tree, that already contains some of the
fixes you submitted.
 

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
