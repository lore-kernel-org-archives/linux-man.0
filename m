From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] fanotify.7: Fix description of FAN_EVENT_NEXT()
Date: Wed, 21 May 2014 12:47:13 +0200
Message-ID: <CAKgNAkj_GhQDaRXSxk1GwYnmWcmjeXp6wDvEcD13KQ7CMBNp0A@mail.gmail.com>
References: <53799494.2080609@gmail.com> <537A5454.2040707@gmx.de>
 <537B05F5.7010800@gmail.com> <537C456D.5090005@gmx.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <537C456D.5090005-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Heinrich,

On Wed, May 21, 2014 at 8:19 AM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
> On 20.05.2014 09:36, Michael Kerrisk (man-pages) wrote:
>>
>> Hi Heinrich,
>>
>> On 05/19/2014 08:58 PM, Heinrich Schuchardt wrote:
>>>
>>> Hello Michael,
>>>
>>> the proposed new description of FAN_EVENT_NEXT is correct.
>>
>>
>> Thanks for checking. I've added a Reviewed-by for you.
>>
>>>
>>> Should FAN_EVENT_METADATA_LEN also be put into the section with macros?
>>>
>>> .B FAN_EVENT_METADATA_LEN
>>> This macro returns the size of structure
>>> .I fanotify_event_metadata
>>> in bytes.
>>> This is the minimum size (and currently the only size) of any event
>>> metadata.
>>
>>
>> I'm inclined not to, but I might be wrong. Is there a reason that
>> user-space might use it?
>
>
> FAN_EVENT_METADATA_LEN is the minimum size of a buffer used to read fanotify
> events. Of cause the user may use sizeof to calculate it himself. Anyway
> there is already some mentioning of FAN_EVENT_METADATA_LEN in fanotify.7.

Okay - I added your text to fanotify(7).

> You remarked inotify read buffers should be 4 byte aligned on some CPUs.
> Shouldn't the same hold true for fanotify?

Yes. So, it looks like a fix to fanotify(7) is required. Could you do
that, please?

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
