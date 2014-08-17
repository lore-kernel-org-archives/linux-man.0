From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] vdso(7): add new i386 vdso symbols in linux-3.15
Date: Sun, 17 Aug 2014 10:36:31 -0500
Message-ID: <53F0CBFF.8060108@gmail.com>
References: <1406997983-23266-1-git-send-email-vapier@gentoo.org> <53EE5D6A.20104@gmail.com> <3845787.Mixr4J3axB@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3845787.Mixr4J3axB@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/16/2014 12:28 AM, Mike Frysinger wrote:
> On Fri 15 Aug 2014 21:20:10 Michael Kerrisk wrote:
>> Thanks. I've applied this patch, but I want to check a point.
>> The subject line mentions Linux 3.15, but the version symbols
>> in the patch say, LINUX_2.6. Is that correct?
> 
> i thought it weird too, but it's what the kernel is doing:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=37c975545ec63320789962bf307f000f08fabd48

Thanks for clearing that up, Mike. I've added the words
"(exported since Linux 3.15)" to each of those three table rows.
Okay?

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
