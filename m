From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] smartpqi: initial submit of smartpqi man page
Date: Fri, 17 Nov 2017 20:31:51 +0100
Message-ID: <5a192512-2625-40a2-a29f-649ed06fd5ff@gmail.com>
References: <150833943926.13185.7883447908516236321.stgit@brunhilda>
 <20171019213558.aelneujzgyucrye3@crack.deadbeast.net>
 <4993A297653ECB4581FA5C3C31323D196721BE80@avsrvexchmbx2.microsemi.net>
 <588a2c6e-f01c-f1e8-9fd0-cdcd414dc973@gmail.com>
 <20171101013656.urhyeq7h2ccclxzu@crack.deadbeast.net>
 <4993A297653ECB4581FA5C3C31323D19698EAC78@avsrvexchmbx1.microsemi.net>
 <CAKgNAkiPn1aiBBwDOdds-WBbQY+NAfnh6QXhp9hBTU_3hhOBKQ@mail.gmail.com>
 <4993A297653ECB4581FA5C3C31323D19698FB27C@avsrvexchmbx2.microsemi.net>
 <CAKgNAkgjsOA2CO5VUF-bYjuyBgr2aiBMZT2V0nvHwzm1sker8Q@mail.gmail.com>
 <4993A297653ECB4581FA5C3C31323D19698FBDFC@avsrvexchmbx2.microsemi.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4993A297653ECB4581FA5C3C31323D19698FBDFC-d/0VHx0KLVy29+vl7/RAAEujk09f5ZhB0e7PPNI6Mm0@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gerry Morong <gerry.morong-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, John Hall <John.Hall-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Bader Ali - Saleh <bader.alisaleh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Teel <scott.teel-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Justin Lindley <justin.lindley-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Benesh <scott.benesh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Don

On 11/17/2017 05:56 PM, Don Brace wrote:
> 
>>> To configure Microsemi Smart Family controllers, please refer to the
>>> controller’s Installation and User’s Guide documentation which can be found
>> by
>>> searching for the controller at https://storage.microsemi.com/
>>
>> What exactly does one search for? I could not easily find the User's Guide.
>>
>> Cheers,
>>
>> Michael
>> --
> 
> I searched the Microsemi site for the controller (example 2100-8i)
> 
> And came to this page:
> https://storage.microsemi.com/en-us/support/sas/sas/aha-2100-8i/
> 
> Yields this document:
> http://download.adaptec.com/pdfs/user_guides/microsemi_smarthba_smartraid_iug_10_2017.pdf
Okay, I get it now. The thing was that the wording made it sound
like there was a single User Guide, which was confusing me (and, 
I suspect, Branden). I've reworded your proposed  text to:

       To configure a Microsemi Smart Family  controller,  refer  to  the
       User Guide for the controller, which can be found by searching for
       the specific controller at ⟨https://storage.microsemi.com/⟩.

I've merged the page into master, and pushed to Git. Thanks for
contributing the page!

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
