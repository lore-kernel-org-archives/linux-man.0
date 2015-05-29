From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [TYPO] man elf
Date: Fri, 29 May 2015 20:32:53 +0200
Message-ID: <5568B0D5.4050607@gmail.com>
References: <CAAxY51Tp3jOWGesj4nWTeeM+_V1J-mvLmRadLMSKnHeh+DHzGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAxY51Tp3jOWGesj4nWTeeM+_V1J-mvLmRadLMSKnHeh+DHzGg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hack NDo <hackndo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/29/2015 12:14 PM, Hack NDo wrote:
> Hi,
> I believe I found a typo in "elf" manpage : The word "how" is missing, as
> shown here :
> 
> Line 61 :
>> e_ident     This array of bytes specifies *[MISSING : HOW]* to interpret
>> the file, independent of the processor or the file's remaining contents.
>> Within this array everything is named by macros, which start with  the
>> prefix EI_ and may contain values which start with the prefix ELF. [...]

Thanks for the report. Fixed!

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
