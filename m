From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: FW: WaitForMultipleObjects/etc. In Kernel
Date: Wed, 29 Jan 2014 11:40:00 +0100
Message-ID: <52E8DA80.7080204@gmail.com>
References: <00d901cf1a19$0ea62db0$2bf28910$@gmail.com> <52E554EC.3090900@ladisch.de> <012d01cf1ae3$6543e340$2fcba9c0$@gmail.com> <52E6219A.3020405@ladisch.de> <00f001cf1ba5$b22f45b0$168dd110$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <00f001cf1ba5$b22f45b0$168dd110$@gmail.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Network Nut <sillystack-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/27/2014 10:21 PM, Network Nut wrote:
> See below.
> 
> -----Original Message-----
> From: Clemens Ladisch [mailto:clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org] 
> Sent: Monday, January 27, 2014 3:07 AM
> To: Network Nut
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: WaitForMultipleObjects/etc. In Kernel
> 
>> BTW, the man page for epoll_wait seems to be incorrect.
> 
> <https://www.kernel.org/doc/man-pages/reporting_bugs.html>
> 
>> "The timeout argument specifies the minimum number of milliseconds
>>        that epoll_wait() will block."
>>
>> I think the word "minimum" should be "maximum".

I've removed the word "minimum" from the sentence. Note that 
"maximum" would not be correct. See the surrounding text for an
explanation of why.

Thanks for the report.

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
