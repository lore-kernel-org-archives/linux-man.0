From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2] vdso.7: update for MIPS
Date: Mon, 18 Apr 2016 14:15:41 +0100
Message-ID: <5714DDFD.1080800@gmail.com>
References: <20160406190137.GH6588@vapier.lan>
 <1460448781-42861-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <20160413020828.GD6588@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160413020828.GD6588-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/13/2016 03:08 AM, Mike Frysinger wrote:
> On 12 Apr 2016 09:13, Zubair Lutfullah Kakakhel wrote:
>> +__kernel_rt_sigreturn	LINUX_2.6 (exported since Linux 4.4)
>> +__kernel_sigreturn	LINUX_2.6 (exported since Linux 4.4)
> 
> are these actually exported ?  looking at vdso.lds.S, only the other two
> are.  my question previously was more about the kernel behavior than it
> was about the docs being incorrect.  your v1 looks fine to merge now (as
> the 4.4 release is already out the door).
> -mike

Thanks for noting this Mike.

Zubair, I've applied the v1 of your patch.

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
