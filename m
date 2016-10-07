From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] core(5): add more details for output paths and the
 crash handler
Date: Fri, 7 Oct 2016 22:50:50 +0200
Message-ID: <d38e7196-abea-79a7-87aa-6c91c2a273ab@gmail.com>
References: <20160928111450.32157-1-vapier@gentoo.org>
 <20161006172437.3329-1-vapier@gentoo.org>
 <50b6faa5-d490-4a18-f2c5-87241fd0aeee@gmail.com>
 <20161007191800.GX21655@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161007191800.GX21655-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/07/2016 09:18 PM, Mike Frysinger wrote:
> On 07 Oct 2016 14:34, Michael Kerrisk (man-pages) wrote:
>> On 10/06/2016 07:24 PM, Mike Frysinger wrote:
>>> People sometimes assume that the crash handler runs in the same context
>>> as the crashing process.  They would be incorrect :).
>>
>> Nice details to add to the page! Thanks for that. I've tweaked the
>> text a little, so you might want to take a look at my changes in
>> commit 4389c7abfffbe.
> 
> looks fine.  wrt /proc/PID vs /proc/[pid], i was using the form that
> core(5) already appeared to use.  should all cases of /proc/PID be
> changed to /proc/[pid] in there ?  there's both now ...

They should be consistent. I've done a sweep and fixed this
(to /proc/[pid]).

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
