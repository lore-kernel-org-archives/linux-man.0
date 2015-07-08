From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] hosts.equiv.5: Fix format, clarify IdM needs, and provide
 examples.
Date: Wed, 08 Jul 2015 01:16:23 -0400
Message-ID: <559CB227.802@redhat.com>
References: <55615A71.4010600@redhat.com> <558134D3.2010603@gmail.com> <55831A5A.2050407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55831A5A.2050407-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arjun Shankar <arjun-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/18/2015 03:22 PM, Michael Kerrisk (man-pages) wrote:
> Hi Carlos,
> 
> In this earlier reply, I should have highlighted that there is
> one open question I have about you patch, at the end of the mail
> below. Could you take a look please.

Certainly.

>>> +Allow all users with matching local accounts in all hosts in the netgroup except baduser:
>>> +.LP
>>> +.RS 4
>>> +.PD 0
>>> +.TP
>>> ++@netgroup -baduser
>>> +.TP
>>> ++@netgroup
>>> +.PD
>>> +.RE
>>> +.TP
>>> +Note: The deny statements must always preceed the allow statements because the file is processed one line at a time.
>>
>> This last explanation feels incomplete. Should it not be something like:
>>
>>    The deny statements must always precede the allow statements 
>>    because the file is processed sequentially until the first
>>    matching rule is found.

Your text is certainly correct and clearer. The processing does stop at
the first match.

Cheers,
Carlos.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
