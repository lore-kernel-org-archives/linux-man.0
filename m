From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getentropy clarifications
Date: Mon, 10 Apr 2017 14:09:41 +0200
Message-ID: <d31930f9-6f0d-8713-5b09-0f82edf1ce47@gmail.com>
References: <1490791607.28079.8.camel@redhat.com>
 <87pogxlm2e.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87pogxlm2e.fsf-ZqZwdwZz9NfTBotR3TxKnbNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fw-d32yF4oPJVt0XxTmqZlbVQ@public.gmane.org>, Nikos Mavrogiannopoulos <nmav-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/31/2017 01:31 PM, Florian Weimer wrote:
> * Nikos Mavrogiannopoulos:
> 
>> +In earlier versions of glibc this function was avaible under the
>> +.BR <sys/random.h>
>> +header.
> 
> It's still available in <sys/random.h>, and the declaration there can
> still be useful if you want to compile without feature test macros.
> 
> In addition, I don't think there ever was a released glibc version
> where getentropy was declared in <sys/random.h>, but not in <unistd.h>
> (with the relevant feature test macros).

Thanks, Florian. I tweaked the page to mention the FTM requirements
when using <unistd.h>, and modified the text in NOTES to read:

       getentropy() is also declared in <sys/random.h>.  (No feature test
       macro  need  be defined to obtain the declaration from that header
       file.)

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
