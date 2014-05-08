From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] stpcpy.3, stpncpy.3: Correct history
Date: Thu, 8 May 2014 11:55:36 +0200
Message-ID: <CAKgNAkifRNL+1KTa1LrRgJGn7dYUYvf8N5n2Q8V5+0RFXZatvQ@mail.gmail.com>
References: <20140224003705.GB28413@iris.usta.de> <5363A48C.7060709@gmail.com> <20140507203300.GM3365@iris.usta.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140507203300.GM3365-1ywcXMbTzNIuZeo0DBJMuQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ingo Schwarze <schwarze-mcycREo4Un4@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Ingo,

On Wed, May 7, 2014 at 10:33 PM, Ingo Schwarze <schwarze-mcycREo4Un4@public.gmane.org> wrote:
> Hi Michael,
>
> Michael Kerrisk (man-pages) wrote on Fri, May 02, 2014 at 03:58:36PM +0200:
>
>> the patch seems more or less okay to me, but given that The AmigaDOS
>> compiler is the merely the oldest instance you could find, I'd prefer
>> a slightly more open wording.
>> How would this be:
>>
>> [[
>> --- a/man3/stpcpy.3
>> +++ b/man3/stpcpy.3
>> @@ -76,9 +76,11 @@ function is thread-safe.
>>  .SH CONFORMING TO
>>  This function was added to POSIX.1-2008.
>>  Before that, it was not part of
>> -the C or POSIX.1 standards, nor customary on UNIX systems, but was not a
>> -GNU invention either.
>> -Perhaps it came from MS-DOS.
>> +the C or POSIX.1 standards, nor customary on UNIX systems.
>> +It first appeared at least as early as 1986,
>> +in the Lattice C AmigaDOS compiler,
>> +then in the GNU fileutils and GNU textutils in 1989,
>> +and in the GNU C library until 1992.

Just fixed: s/until/in/

>>  It is also present on the BSDs.
>>  .SH BUGS
>>  This function may overrun the buffer
>>
>> ]]
>>
>> ?
>
> Yes, that seems a safer claim, and it reads very well.
> I like your wording.
>
> Thank you for looking into this,

You're welcome. Thanks for the patch!

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
