From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: syslog(3) inconsistency
Date: Mon, 27 Mar 2017 11:49:10 +0200
Message-ID: <58D8E016.8000907@bfs.de>
References: <8ab6f0a9-1a71-c776-80a2-5913e941aaf2@mev.co.uk> <4f302a52-1098-2b1a-baac-732b15784ee4@gmail.com> <bee344ea-5734-8106-183c-4530e2d245d6@mev.co.uk> <5d6ef264-1afe-0059-38fb-c7ebe7657b72@gmail.com> <68bdb70e-a70f-19a7-d85d-922c18d60833@mev.co.uk>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <68bdb70e-a70f-19a7-d85d-922c18d60833-GUHe90Wt2aFaa/9Udqfwiw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 27.03.2017 11:34, schrieb Ian Abbott:
> On 26/03/17 13:46, Michael Kerrisk (man-pages) wrote:
>> On 03/24/2017 06:26 PM, Ian Abbott wrote:
>>> On 24/03/2017 14:40, Michael Kerrisk (man-pages) wrote:
>>>> Hello Ian,
>>>>
>>>> On 03/23/2017 07:37 PM, Ian Abbott wrote:
>>>>> Hi,
>>>>>
>>>>> The first parameter of `syslog()` is called `priority` in the
>>>>> man-page,
>>>>> except in the breakdown of the possible log levels, where it is called
>>>>> `level`.
>>>>
>>>> Your report doesn't say clearly which pieces of text you find to
>>>> be incorrect, but I wonder if you have missed this sentence in the
>>>> man page:
>>>>
>>>>     The priority argument is formed by ORing the facility and the
>>>>     level values (explained below).
>>>
>>> Oh, that's it!  My mistake.  Apologies for the noise.
>>
>> So, I think the metapoint brought out by the comments of you and
>> Walter is that the text of the page is not really organized in a
>> way that is easy to parse. (And a few notable details were also
>> missing, I see.) I've reworked the page quite a bit to (I hope)
>> make the information easier to parse. The revised version
>> is already pushed to Git, in case you want to take a look.
> 
> Well I can tell you how my mental process worked in this case if it
> helps.  Basically, I'd skipped over the bit that described the
> 'priority' argument as being composed of two parts OR'ed together, and
> went straight to what I thought was a description of each function
> argument, so I thought the description of the 'level' was really a
> description of the 'priority' argument.  A sentence similar to "This
> forms part of the 'priority' argument, together with the 'facility'
> value." would have helped me, but then again, so would reading the man
> page properly!
> 
> The description of 'level' mentions 'setlogmask(3)', but that man page
> calls the levels "priorities".
> 

Do you thing an other word than "priorities" would help ?

Also I have the feeling that the lists below and the fact that you are
looking for a parameter, draws the attention quickly to these list.

My next idea was the example i posted. For me ist very simple do you thing
that would clarify things more easy ?


re,
 wh



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
