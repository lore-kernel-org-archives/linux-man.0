From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] elf(5): document notes
Date: Sun, 27 Nov 2016 12:01:10 +0100
Message-ID: <3e53522c-d13f-f2f2-aa57-07e3f32448cf@gmail.com>
References: <20161117205939.2295-1-vapier@gentoo.org>
 <2dbf5664-524e-9411-16f4-2a84e6395c82@gmail.com>
 <20161118182547.GY21655@vapier.lan>
 <CAKgNAkgqWayEyq5iej=+2y+uyD9BsLNDNHhAC539L955aet56w@mail.gmail.com>
 <20161127033225.GU21655@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161127033225.GU21655-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/27/2016 04:32 AM, Mike Frysinger wrote:
> On 19 Nov 2016 11:13, Michael Kerrisk (man-pages) wrote:
>> On 18 November 2016 at 19:25, Mike Frysinger wrote:
>>> On 18 Nov 2016 08:25, Michael Kerrisk (man-pages) wrote:
>>>> On 11/17/2016 09:59 PM, Mike Frysinger wrote:
>>>>> for documenting the Elf{32,64}_Nhdr structure,
>>>>> the sections/segments that contain notes, and how to interpret them.  I've
>>>>> been lazy and only included the GNU extensions here,
>>>>
>>>> Any chance you include the non-GNU stuff also? Or, failing that,
>>>> some clear statements at appropriate points about what is not
>>>> documented.
>>>
>>> the trouble i was running into is that the man pages says it documents
>>> the elf.h header, but the one installed by glibc doesn't have defines
>>> for all the non-GNU stuff.  so if i put in details about the FreeBSD
>>> namespace, it'll have defines like NT_FREEBSD_THRMISC.  none of those
>>> show up in the current elf.h though so people will get errors.
>>>
>>> i'm fine with that though if you are.
>>
>> Actually, it sounds like your original approach is best then.
> 
> i'll send some patches to glibc and see if i can't get the defines merged.
> if so, i'll update the man page.

Okay. Thanks!

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
