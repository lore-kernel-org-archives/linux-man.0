From: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: malloc_stats(3) man page for review
Date: Sat, 5 May 2012 17:17:13 -0400
Message-ID: <CAHGf_=o41qwpWOxvToVHj-uaQqbfGNH73pKwXG8-anpd4Jm1FA@mail.gmail.com>
References: <CAKgNAkiC4Qb-yBoEf1mmSBcUFuH3yB0OT6Vvni5z_Lci5=6eSA@mail.gmail.com>
 <CAHGf_=r=po=XEyxPn6fBUFpHkVdttsKPVZDZRW5vieY8z2fC8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHGf_=r=po=XEyxPn6fBUFpHkVdttsKPVZDZRW5vieY8z2fC8w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

>> and the total number of bytes consumed by in-use allocations.
>> (These two values correspond to the
>> .I arena
>> and
>> .I uordblks
>> fields retrieved by
>> .BR mallinfo (3).)
>> In addition,
>> the function prints the sum of these two statistics for all arenas,
>> and the maximum number of blocks and bytes that were ever simultaneo=
usly
>> allocated using
>> .BR mmap (2).
>>
>
> If I understand correctly, this function output =A0"Total (incl.
> mmap):\n" header, but
> "system bytes" and "in use bytes" don't include mmaped chunk. So, It =
would be
> nice if a bug section describe it.
>
> But I'm not an expert on this area. Please don't 100% trust me.

I'm sorry. I was incorrect. stat work correctly. please forget this.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
