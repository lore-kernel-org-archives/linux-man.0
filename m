From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] fts.3 is not available in LFS builds
Date: Mon, 17 Mar 2014 07:06:16 -0700
Message-ID: <20140317140616.GA15958@infradead.org>
References: <20140315135416.GA10430@infradead.org>
 <CAKgNAkgqXUf0yWaXyAD7yBJgivp9Jmwvz4EAnh_DpyActuoGwA@mail.gmail.com>
 <20140316172219.GA16900@infradead.org>
 <5326FF14.7010305@gmail.com>
 <20140317140118.GA11576@infradead.org>
 <CAKgNAkh7ES18jT2coD39ZXvjUxkrZavaG=SufNS_-16SgM3kUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkh7ES18jT2coD39ZXvjUxkrZavaG=SufNS_-16SgM3kUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Mar 17, 2014 at 03:02:53PM +0100, Michael Kerrisk (man-pages) wrote:
> Oh! I thought most distributors built their 32-bit distros with
> -D_FILE_OFFSET_BITS=64 these days? Am I wrong? (I don't have any
> 32-bit systems handy to sample from.)

I think some build systems try to enforce it, but last time Eric Sandeen
checked we still had lots of packages not picking it up.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
