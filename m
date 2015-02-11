From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getgrent.3: Modify thread-safety information
Date: Wed, 11 Feb 2015 08:16:52 +0100
Message-ID: <CAKgNAkiJy=JKkgAC4XTA-hrN38j51cEYo3bmKK8WrczC3cC4Ww@mail.gmail.com>
References: <1423554863-26245-1-git-send-email-mashimiao.fnst@cn.fujitsu.com> <54DB00FF.2060502@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54DB00FF.2060502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

I meant to add: for this patch and the getpwent.3 patch, I adjusted
the formatting somewhat. As far as possible, I prefer not to have
tables wrap wider than 80 columns.

Thanks,

Michael


On 11 February 2015 at 08:13, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 02/10/2015 08:54 AM, Ma Shimiao wrote:
>> As annotation in glibc manual is more detailed, change the
>> thread-safety information to be the same as glibc manual.
>
> Thanks, Ma Shimiao. Applied.
>
> Cheers,
>
> Michael
>
>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>
>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>> ---
>>  man3/getgrent.3 | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/man3/getgrent.3 b/man3/getgrent.3
>> index f3240aa..21d4759 100644
>> --- a/man3/getgrent.3
>> +++ b/man3/getgrent.3
>> @@ -168,16 +168,16 @@ For an explanation of the terms used in this section, see
>>  .BR attributes (7).
>>  .TS
>>  allbox;
>> -lbw22 lb lb
>> +lbw11 lb lbw41
>>  l l l.
>>  Interface    Attribute       Value
>>  T{
>>  .BR getgrent ()
>> -T}   Thread safety   MT-Unsafe
>> +T}   Thread safety   MT-Unsafe race:grent race:grentbuf locale
>>  T{
>>  .BR setgrent (),
>>  .BR endgrent ()
>> -T}   Thread safety   MT-Safe
>> +T}   Thread safety   MT-Unsafe race:grent locale
>>  .TE
>>  .SH CONFORMING TO
>>  SVr4, 4.3BSD, POSIX.1-2001.
>>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
