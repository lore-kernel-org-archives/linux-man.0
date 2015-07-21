From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] hosts.equiv.5: Fix format, clarify IdM needs, and provide
 examples.
Date: Tue, 21 Jul 2015 16:03:24 +0200
Message-ID: <55AE512C.7080001@gmail.com>
References: <55615A71.4010600@redhat.com> <558134D3.2010603@gmail.com> <55831A5A.2050407@gmail.com> <559CB227.802@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <559CB227.802-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arjun Shankar <arjun-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/08/2015 07:16 AM, Carlos O'Donell wrote:
> On 06/18/2015 03:22 PM, Michael Kerrisk (man-pages) wrote:
>> Hi Carlos,
>>
>> In this earlier reply, I should have highlighted that there is
>> one open question I have about you patch, at the end of the mail
>> below. Could you take a look please.
> 
> Certainly.
> 
>>>> +Allow all users with matching local accounts in all hosts in the netgroup except baduser:
>>>> +.LP
>>>> +.RS 4
>>>> +.PD 0
>>>> +.TP
>>>> ++@netgroup -baduser
>>>> +.TP
>>>> ++@netgroup
>>>> +.PD
>>>> +.RE
>>>> +.TP
>>>> +Note: The deny statements must always preceed the allow statements because the file is processed one line at a time.
>>>
>>> This last explanation feels incomplete. Should it not be something like:
>>>
>>>    The deny statements must always precede the allow statements 
>>>    because the file is processed sequentially until the first
>>>    matching rule is found.
> 
> Your text is certainly correct and clearer. The processing does stop at
> the first match.

Okay -- I've made that change to the text.

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
