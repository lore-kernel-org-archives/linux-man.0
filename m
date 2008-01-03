From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: arch_prctl.2 changes
Date: Thu, 03 Jan 2008 11:10:30 +0100
Message-ID: <477CB496.6040302@gmail.com>
References: <477B5F43.3070009@gmail.com> <200801021103.40079.ak@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200801021103.40079.ak-l3A5Bk7waGM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <ak-l3A5Bk7waGM@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Andi Kleen wrote:
> On Wednesday 02 January 2008 10:54:11 Michael Kerrisk wrote:
>> Hi Andi,
>>
>> I noticed some apparent inconsistencies in the arch_prctl.2 page
>> (http://www.kernel.org/doc/man-pages/online/pages/man2/arch_prctl.2.html ).
>>  The main issue is that 'addr' is interpreted as an unsigned long or as an
>> unsigned long *, depending on code.  (right?)
> 
> Yes.
> 
>> For man-pages-2.75, I have applied the following patch, which also updates
>> a few other minor points.  Does this look okay to you?
> 
> Yes.

Okay.  Thanks Andi!

Cheers,

Michael

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html


-
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
