From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] fgetgrent.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Feb 2015 09:28:29 +0100
Message-ID: <CAKgNAki3zOD8-C8PmsDmeqVdY0yOTA=wAR_1giZF3U3-N9i-fQ@mail.gmail.com>
References: <1423640156-25233-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
 <54DB0AE3.1080406@gmail.com> <54DB10D4.1050508@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54DB10D4.1050508-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Ma Shmiao,

On 11 February 2015 at 09:20, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> Hi Michael,
> On 02/11/2015 03:55 PM, Michael Kerrisk (man-pages) wrote:
>> On 02/11/2015 08:35 AM, Ma Shimiao wrote:
>>> The marking matches glibc marking.
>>>
>>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>>> ---
>>>  man3/fgetgrent.3 | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/man3/fgetgrent.3 b/man3/fgetgrent.3
>>> index 57665dd..e599483 100644
>>> --- a/man3/fgetgrent.3
>>> +++ b/man3/fgetgrent.3
>>> @@ -90,6 +90,18 @@ is set to indicate the cause.
>>>  Insufficient memory to allocate
>>>  .I group
>>>  structure.
>>> +.SH ATTRIBUTES
>>> +For an explanation of the terms used in this section, see
>>> +.BR attributes (7).
>>> +.TS
>>> +allbox;
>>> +lb lb lb
>>> +l l l.
>>> +Interface   Attribute       Value
>>> +T{
>>> +.BR fgetgrent ()
>>> +T}  Thread safety   MT-Unsafe race:fgrent
>>
>> Why the change here in the V2? What does "fgrent" refer to?
>
> race:fgrent is right mark, I made a mistake.
> race:fgrent is similar to race:grent.
> race:grent is used to indicate data race exists in getgrent(), setgrent() and endgrent().
> race:fgrent is used to indicate data race exists when using fgetgrent() in multi-thread.

My question then is: how does the reader know that "grent" refers to
"getgrent(), setgrent() and endgrent()"?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
