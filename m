From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ATTRIBUTES patch problems!
Date: Sat, 11 Apr 2015 08:35:46 +0200
Message-ID: <5528C0C2.1020508@gmail.com>
References: <1427253330-27357-1-git-send-email-zenglg.jy@cn.fujitsu.com>	 <1427878863-17821-1-git-send-email-zenglg.jy@cn.fujitsu.com>	 <551FA25F.9020804@gmail.com> <1428380951.6749.60.camel@G08JYZSD130126.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428380951.6749.60.camel-HPT4HQ9wKwaGsR6CxgJlS1Kr0EmMEXJSn9A1Ff6Mc9Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/07/2015 06:29 AM, Zeng Linggang wrote:
> Hello, Mr Michael!
> 
> On Sat, 2015-04-04 at 09:35 +0100, Michael Kerrisk (man-pages) wrote:
>> [Was: Re: [PATCH v3] getutent.3: ATTRIBUTES: Note functions those 
>> aren't thread-safe]
>>
>> On 04/01/2015 10:01 AM, Zeng Linggang wrote:
>>> The markings match glibc markings.
>>
>> Hello Zeng Linggang and Ma Shimiao,
>>
>> Arrgghhh! What is going on?
>>
> 
> We are so sorry to bring you so much trouble.
> 
>> I started processing this queue of patches from Zeng Linggang, 
>> and now I see there are v2 and even now a v3 patch for some 
>> of the pages! With no explanation of the differences in 
>> one version of the patches from one version to the next...
>> And all of the different versions of the patches with a 
>> statement that the markings match the glibc markings...
>> That can't be true, because the different versions of the 
>> man-pages patches have different markings! (At least in the 
>> cases that I looked at.) Please explain.
>>
> 
> Hmm, we have checked the different version carefully, we did not change
> the markings. We just found some blemish in V1('lb' --> 'lbw[x]' and in
> the third column some markings are too long we added '.br'). In V3 we
> just added explanation for "race:utent". So sorry for no adding any
> statements for the changes. If you find the different markings, we are
> glad to be noticed.

Okay -- thanks.

>> And, all of the v1 patches are signed off by Ma Shimiao, implying
>> some degree of review by Ma Shimiao. Is this true? If so, why
>> do I get two or even three versions of the patches? Please 
>> explain.
>>
>> I'm not happy about this. And I'd rather you could explain what's 
>> happening, and fix the problem. I'm sorry, but Zeng Linggang,
>> I have just reverted all the patches that I just applied from you,
>> and I've deleted the remaining v2 and v3 patches from you. Could you
>> get together with Ma Shimiao and send me new correct versions 
>> of these patches. And please, Ma Shimiao, if your name goes
>> into the Signed-off-by, I take this as some indication that you
>> checked the patches. If that's not the case, I should not see a 
>> Signed-off-by.
>>
>> For the future, could you both, when sending patches, please 
>> in the commit message also quote the text of the glibc markings
>> so I can compare. (Just quoting the source text is fine.)
>>
> 
> OK. We will send new patches with the glibc markings ASAP.

Thanks, Zeng.

Cheers,

Michael


> Zeng
> 
>> Thanks,
>>
>> Michael
>>
>>
>>
>>> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>>> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>>> ---
>>>  man3/getutent.3 | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 55 insertions(+)
>>>
>>> diff --git a/man3/getutent.3 b/man3/getutent.3
>>> index 4ff5581..1611d9b 100644
>>> --- a/man3/getutent.3
>>> +++ b/man3/getutent.3
>>> @@ -155,6 +155,61 @@ functions can also fail for the reasons described in
>>>  /var/run/utmp	database of currently logged-in users
>>>  .br
>>>  /var/log/wtmp	database of past user logins
>>> +.SH ATTRIBUTES
>>> +For an explanation of the terms used in this section, see
>>> +.BR attributes (7).
>>> +.TS
>>> +allbox;
>>> +lb lb lbw28
>>> +l l l.
>>> +Interface	Attribute	Value
>>> +T{
>>> +.BR getutent ()
>>> +T}	Thread safety	T{
>>> +MT-Unsafe init race:utent
>>> +.br
>>> +race:utentbuf sig:ALRM timer
>>> +T}
>>> +T{
>>> +.BR getutid (),
>>> +.br
>>> +.BR getutline ()
>>> +T}	Thread safety	T{
>>> +MT-Unsafe init race:utent
>>> +.br
>>> +sig:ALRM timer
>>> +T}
>>> +T{
>>> +.BR pututline ()
>>> +T}	Thread safety	T{
>>> +MT-Unsafe race:utent
>>> +.br
>>> +sig:ALRM timer
>>> +T}
>>> +T{
>>> +.BR setutent (),
>>> +.br
>>> +.BR endutent (),
>>> +.br
>>> +.BR utmpname ()
>>> +T}	Thread safety	MT-Unsafe race:utent
>>> +.TE
>>> +
>>> +In the above table,
>>> +.I utent
>>> +in
>>> +.I race:utent
>>> +signifies that if any of the functions
>>> +.BR setutent (3),
>>> +.BR getutent (3),
>>> +.BR getutid (3),
>>> +.BR getutline (3),
>>> +.BR pututline (3),
>>> +.BR utmpname (3),
>>> +or
>>> +.BR endutent (3)
>>> +are used in parallel in different threads of a program,
>>> +then data races could occur.
>>>  .SH CONFORMING TO
>>>  XPG2, SVr4.
>>>  .LP
>>>
>>
>>
> 
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
