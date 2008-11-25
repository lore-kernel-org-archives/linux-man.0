From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: Documentation for CLONE_NEWPID
Date: Tue, 25 Nov 2008 11:27:33 -0500
Message-ID: <cfd18e0f0811250827q71b4f07l33821d004f27adf3@mail.gmail.com>
References: <4923810B.7010201@gmail.com> <492AA241.6050004@openvz.org>
	 <cfd18e0f0811250746i711205dej6b98f2fba6cecc42@mail.gmail.com>
	 <492C1FCB.1080405@openvz.org>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753275AbYKYQ1q@vger.kernel.org>
In-Reply-To: <492C1FCB.1080405@openvz.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Emelyanov <xemul@openvz.org>
Cc: Kir Kolyshkin <kir@openvz.org>, linux-man@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hi Pavel,

[...]

>> *** Here's where I make the point about each process having multiple PIDs"
>>
>>>> +The existence of a namespace hierarchy means that each process
>>>> +may now have multiple PIDs:
>>>> +one for each namespace in which it is visible.
>>
>> I added some words here:
>>
>> "each of these PIDs is unique within the corresponding namespace".
>
> Correct.

Thanks for the ACK.

>>>> +(A call to
>>>> +.BR getpid (2)
>>>> +always returns the PID associated with the namespace in which
>>>> +the process was created.)
>>> I don't thinks it's a good example - the getpid cannot be called
>>> for other process other than current :)
>>
>> It wasn't meant as an example.  The point was, with a process
>> potentially being a member of multiple namespaces, the reader might
>> wonder: what does getpid(2) return?  This sentence was intended to
>> clarify that.  With that explanation, does this sentence now seem
>> okay?
>
> Yes, but I'd change "was created" into "lives in". From my POV this
> sounds more clear. I do not insist however :)

Done.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
