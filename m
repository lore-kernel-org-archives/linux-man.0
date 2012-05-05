From: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: malloc_stats(3) man page for review
Date: Sat, 5 May 2012 17:13:35 -0400
Message-ID: <CAHGf_=r=po=XEyxPn6fBUFpHkVdttsKPVZDZRW5vieY8z2fC8w@mail.gmail.com>
References: <CAKgNAkiC4Qb-yBoEf1mmSBcUFuH3yB0OT6Vvni5z_Lci5=6eSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiC4Qb-yBoEf1mmSBcUFuH3yB0OT6Vvni5z_Lci5=6eSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi

> .B void malloc_stats(void);
> .SH DESCRIPTION
> The
> .BR malloc_stats ()
> function prints (on standard error) statistics about memory allocated by
> .BR malloc (3)
> and related functions.
> For each arena (allocation area), this function prints
> the total amount of memory allocated by means other than
> .BR mmap (2)

If I understand correctly, A chunk that allocated by mmap (i.e.
IS_MMAPD marked one)
doesn't belong to arena. iow, chunk_for_arena() don't work for mmaped
chunk. then,

For each arena (allocation area), this function prints
the total amount of memory.

is enough.


> and the total number of bytes consumed by in-use allocations.
> (These two values correspond to the
> .I arena
> and
> .I uordblks
> fields retrieved by
> .BR mallinfo (3).)
> In addition,
> the function prints the sum of these two statistics for all arenas,
> and the maximum number of blocks and bytes that were ever simultaneously
> allocated using
> .BR mmap (2).
>

If I understand correctly, this function output  "Total (incl.
mmap):\n" header, but
"system bytes" and "in use bytes" don't include mmaped chunk. So, It would be
nice if a bug section describe it.

But I'm not an expert on this area. Please don't 100% trust me.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
