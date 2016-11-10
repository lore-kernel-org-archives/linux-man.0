From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Update the random(4) documentation towards a more
 accurate view on /dev/urandom
Date: Thu, 10 Nov 2016 15:19:07 +0100
Message-ID: <e17ded03-f924-36e6-1a9f-4045790e638c@gmail.com>
References: <1461574090.32558.45.camel@redhat.com>
 <1470052099.2926.6.camel@redhat.com> <1476952646.2522.10.camel@redhat.com>
 <b07fb334-149d-cf65-74f3-1d1951e5981b@gmail.com>
 <1478768067.2642.23.camel@redhat.com>
 <e5c1f87c-aad0-b526-a346-74348a36c2a3@gmail.com>
 <1478778837.2642.26.camel@redhat.com>
 <05152136-6943-8ada-3d65-51ef4ce9c1b1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <05152136-6943-8ada-3d65-51ef4ce9c1b1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>, Stephan Mueller <smueller-T9tCv8IpfcWELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Carl_Winb=c3=a4ck?= <c@tunnel53.net>, Laurent Georget <laurent-AyimVQWTEHzsq35pWSNszA@public.gmane.org>, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/10/2016 12:56 PM, Michael Kerrisk (man-pages) wrote:
> On 11/10/2016 12:53 PM, Nikos Mavrogiannopoulos wrote:
>> On Thu, 2016-11-10 at 12:50 +0100, Michael Kerrisk (man-pages) wrote:
>>> Hello Nikos,
>>
>>>>>>  If a seed file is saved across reboots as recommended below
>>>>>> (all
>>>>>> major
>>>>>>  Linux distributions have done this since 2000 at least), the
>>>>>> output is
>>>>>> -- 2.7.4
>>>>> Laurent Georget also commented on this page in a mail last year.
>>>>> I'm going to thread you (and the other people on this mail) into
>>>>> that mail discussion in case there's something there that you
>>>>> might incorporate into a revised patch.
>>>>
>>>> I think it was a different paragraph. Replied in the other email.
>>>
>>> Okay.
>>>
>>> I've applied your patch. Thanks for persisting with this.
>>> After massaging the text a little, I have also applied 
>>> the following wording fix, which I hope is okay:
>>
>> The new text is fine with me.
> 
> Thanks, Nikos.

All the changes we discussed so far are now pushed to Git.
I'll now send out a couple of proposed patches.

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
