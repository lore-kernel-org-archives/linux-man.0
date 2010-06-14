From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: Unable to parse a sentence in sync_file_range.2
Date: Mon, 14 Jun 2010 03:47:37 -0400
Message-ID: <20100614074737.GA27379@infradead.org>
References: <7b3bdec71002181532o4ed24f53j121c3923ea7fa8df@mail.gmail.com>
 <cfd18e0f1002210534x54997e93g3e9323e678e22cb9@mail.gmail.com>
 <AANLkTilxmxNTK9Q7B0dH9v1XH7CAUCrdcw-qFgi4yzLG@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTilxmxNTK9Q7B0dH9v1XH7CAUCrdcw-qFgi4yzLG-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> >> ?When writing into preallocated space, many filesystems also
> >> ?require calls into the block allocator, which this system
> >> ?call does not sync out to disk.
> >>
> >> Can someone please rephrase it? ?In particular, what does 'which' refer to?
> >> Thanks.

How about:

Usually filesystems also need to update metadata when writing into
preallocated space.  This system call does not guarantee the persistance
of conversions from preallocated to regularly allocated space.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
