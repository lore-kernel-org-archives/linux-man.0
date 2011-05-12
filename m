From: John Hammond <jhammond-Tmo6s3XX3Xr5xfTjtVVUew@public.gmane.org>
Subject: Re: [PATCH] setbuf.3: stdio buffers are allocated by mmap() not malloc()
Date: Thu, 12 May 2011 11:45:54 -0500
Message-ID: <4DCC0EC2.5030901@tacc.utexas.edu>
References: <4DCAFFE0.7030307@tacc.utexas.edu> <BANLkTin6ogPpQFDAkezygqAVtcfRZnoMMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTin6ogPpQFDAkezygqAVtcfRZnoMMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Stefan,

> A little peer review before the maintainer gets a chance to reply...

Of course.

> On Thu, May 12, 2011 at 12:30 AM, John Hammond <jhammond-Tmo6s3XX3Xr5xfTjtVVUew@public.gmane.org> wrote:
>> ---
>> --- a/man3/setbuf.3
>> +++ b/man3/setbuf.3
>> @@ -83,7 +83,7 @@ may be used to force the block out early.
>>  .BR fclose (3).)
>>  Normally all files are block buffered.
>>  When the first I/O operation occurs on a file,
>> -.BR malloc (3)
>> +.BR mmap (2)
>>  is called, and a buffer is obtained.
>>  If a stream refers to a terminal (as
>>  .I stdout
> 
> Are you sure this applies to older glibc versions as well? When
> behavior of a glibc function has changed in time, usually (or I should
> probably rephrase this as "in the most fortunate cases..." :), but
> let's not be that pessimistic ) the man page specifies that; if it's
> the case here, it might be good to say: "mmap is used since glibc x.y,
> malloc was used before".

malloc() was used in 1.09, and mmap() in 2.0.1.  I've also noticed this
behavior other versions, including 2.3.4 and 2.13 (current).  But I
haven't checked all intermediate versions.  See also
http://sources.redhat.com/ml/libc-alpha/2006-11/msg00061.html for some
fruitless discussion of this issue.

Best,

John
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
