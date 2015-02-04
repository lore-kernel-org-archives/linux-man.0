From: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH] nan.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 4 Feb 2015 17:52:35 +0800
Message-ID: <54D1EBE3.8060501@cn.fujitsu.com>
References: <1423032306-12529-1-git-send-email-mashimiao.fnst@cn.fujitsu.com> <54D1CFEB.70109@gmail.com> <54D1DEB9.7020707@cn.fujitsu.com> <CAKgNAkh-h3E45bq6RPBJEyjb2EsRagCeymQi1uCQyQXVzV54Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkh-h3E45bq6RPBJEyjb2EsRagCeymQi1uCQyQXVzV54Rw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

On 02/04/2015 05:31 PM, Michael Kerrisk (man-pages) wrote:
> Hello Ma Shimiao,
> 
> On 4 February 2015 at 09:56, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
>> Hi Michael,
>> On 02/04/2015 03:53 PM, Michael Kerrisk (man-pages) wrote:
>>> On 02/04/2015 07:45 AM, Ma Shimiao wrote:
>>>> The markings match glibc markings.
>>>
>>> Hi Ma Shimiao.
>>>
>>> Patch applied. Thanks! But I had to fix up the formatting a little.
>>> Please do check the rendered version of each page that is patched.
>>
>> Sorry, I can't find out what's wrong with the formatting.
>> Could you tell me what's wrong with the formatting?
>> Or you send me your fixed version, let me find out the difference.
>> Thanks a lot.
> 
> Sorry -- of course I should have done that. See
> http://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/?h=mt_attributes&id=f83348c6b12fee3f016449cb2b1eee7dd901af6c
> That just fixes the formatting so that we don't get large whitespaces
> in the left hand column of the table.
Thanks for fixing.
But, could you tell me which editor do you use to review the formatting?
I think maybe my tools are too weak to find out the difference.
I always check the formatting by command like "man ./nan.3" in fedora 20.
And I find nothing difference before fixing and after fixing the formatting.

Thanks,
> 
> Thanks,
> 
> Michael
> 
> 
>>>
>>> Thanks,
>>>
>>> Michael
>>>
>>>
>>>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>>>> ---
>>>>  man3/nan.3 | 14 ++++++++++++++
>>>>  1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/man3/nan.3 b/man3/nan.3
>>>> index 6c9deb6..da04cba 100644
>>>> --- a/man3/nan.3
>>>> +++ b/man3/nan.3
>>>> @@ -72,6 +72,20 @@ selects one.
>>>>  On other systems it may do nothing.
>>>>  .SH VERSIONS
>>>>  These functions first appeared in glibc in version 2.1.
>>>> +.SH ATTRIBUTES
>>>> +For an explanation of the terms used in this section, see
>>>> +.BR attributes (7).
>>>> +.TS
>>>> +allbox;
>>>> +lb lb lb
>>>> +l l l.
>>>> +Interface   Attribute       Value
>>>> +T{
>>>> +.BR nan (),
>>>> +.BR nanf (),
>>>> +.BR nanl ()
>>>> +T}  Thread safety   MT-Safe locale
>>>> +.TE
>>>>  .SH CONFORMING TO
>>>>  C99, POSIX.1-2001.
>>>>  See also IEC 559 and the appendix with
>>>>
>>>
>>>
>>
>>
>> --
>> Ma Shimiao
>> Development Dept.I
>> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> 
> 
> 


-- 
Ma Shimiao
Development Dept.I
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
