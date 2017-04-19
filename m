From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: renameat2 doesn't have a no-glibc-wrapper note
Date: Wed, 19 Apr 2017 15:26:10 +0200
Message-ID: <b0e95d1e-b4dd-1fa3-1dc1-e0cd043c20b5@gmail.com>
References: <20170312230909.GA13985@dell12.lru.li>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170312230909.GA13985-FBHWoc2sFkwTXckIgbG3eg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georg Sauthoff <mail-vzQcyvifq/Y@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Georg.

On 03/13/2017 12:09 AM, Georg Sauthoff wrote:
> Hello,
> 
> the renameat2(2) man page [1] currently doesn't mention that you have to use
> sycall() to access it. Tested it with glibc-2.24-4.fc25.x86_64.
> 
> Can you add notes similar to what e.g. kcmp(2) [2] has?

Thanks for reporting this. I've added some text to the rename(2)
page to note the requirement to use syscall(2).

Cheers,

Michael


> I mean:
> 
>> Note: There is no glibc wrapper for this system call; see NOTES.
>> [..]
>> NOTES
>>
>>        Glibc does not provide a wrapper for this system call; call it using
>>        syscall(2).
> 
> 
> Best regards
> Georg
> 
> [1]: http://man7.org/linux/man-pages/man2/renameat2.2.html
> [2]: http://man7.org/linux/man-pages/man2/kcmp.2.html
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
