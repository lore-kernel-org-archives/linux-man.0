From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: malloc_stats(3) man page for review
Date: Sun, 6 May 2012 10:16:04 +1200
Message-ID: <CAKgNAkiF07_7Mp9T15NYngB-=-ph=f451JPf=hpfuh0H55C+uQ@mail.gmail.com>
References: <CAKgNAkiC4Qb-yBoEf1mmSBcUFuH3yB0OT6Vvni5z_Lci5=6eSA@mail.gmail.com>
 <CAHGf_=r=po=XEyxPn6fBUFpHkVdttsKPVZDZRW5vieY8z2fC8w@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHGf_=r=po=XEyxPn6fBUFpHkVdttsKPVZDZRW5vieY8z2fC8w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, May 6, 2012 at 9:13 AM, KOSAKI Motohiro
<kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi
>
>> .B void malloc_stats(void);
>> .SH DESCRIPTION
>> The
>> .BR malloc_stats ()
>> function prints (on standard error) statistics about memory allocated by
>> .BR malloc (3)
>> and related functions.
>> For each arena (allocation area), this function prints
>> the total amount of memory allocated by means other than
>> .BR mmap (2)
>
> If I understand correctly, A chunk that allocated by mmap (i.e.
> IS_MMAPD marked one)
> doesn't belong to arena. iow, chunk_for_arena() don't work for mmaped
> chunk. then,
>
> For each arena (allocation area), this function prints
> the total amount of memory.
>
> is enough.

Thanks Motohiro. As far as I can see you are correct. I'll make that change.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
