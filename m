From: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mallinfo(3) man page for review
Date: Sat, 5 May 2012 17:25:38 -0400
Message-ID: <CAHGf_=r-TdDutTEvmmVRGyzKA_0Txh5gMRLJ6nNu1GZnjsiOxg@mail.gmail.com>
References: <CAKgNAkg2CKaEsOERkLyhsJ9N9nEpCm7oe_XzMBE1XBB_KkDoiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkg2CKaEsOERkLyhsJ9N9nEpCm7oe_XzMBE1XBB_KkDoiQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi

On Fri, May 4, 2012 at 8:08 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I've written the man page page below to document glibc's mallinfo(3).
> Review comments welcome!
>
> Cheers,
>
> Michael

I don't find any issue. a few nit are below.


> .TP 10
> .I arena
> The total amount of memory allocated by means other than
> .BR mmap (2)
> (i.e., memory allocated on the heap).
> This figure includes both in-use blocks and blocks on the free list.
> .TP
> .I ordblks
> The number of ordinary (i.e., non-fastbin) free blocks.
> .TP
> .I smblks
> The number of fastbin free blocks (see
> .BR mallopt (3)).

It would be nice if a meaning of fastbin was described here.
It is allocation cache (for increasing cpu cache hit ratio) from
point of bird view.

> .TP
> .I hblks
> The number of blocks currently allocated using
> .BR mmap (2).

It would be nice if glibc malloc try to allocate memory by using mmap directly
if size is greater than MMAP_THRESHOLD.

Also nice if refer mallopt and MMAP_THRESHOLD.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
