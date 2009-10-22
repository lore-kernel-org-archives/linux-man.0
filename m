From: Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
Subject: Re: crypt (3) significant key lenght (DES, MD5, SHA)
Date: Thu, 22 Oct 2009 14:01:56 +0200 (CEST)
Message-ID: <alpine.LSU.2.00.0910221401270.21754@obet.zrqbmnf.qr>
References: <alpine.DEB.2.00.0910081256550.1467@luna.local.presi.org> <alpine.LSU.2.00.0910221356250.21589@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LSU.2.00.0910221356250.21589-SHaQjdQMGhDmsUXKMKRlFA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: presidev-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk-manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org


cc linux-man

On Thursday 2009-10-22 14:01, Jan Engelhardt wrote:

>In CRYPT.3:
>>"In the SHA implementation the entire key is significant (instead of 
>>only the first 8 bytes in MD5)."
>>
>>Is wrong the old version? (though I think MD5 has more than 8 bytes 
>>significant of the key) Can someone clarify this? or I am missing 
>>something?
>
>Correct would be:
>
>* DES only uses the first 8 plaintext chars
>* Blowfish $2a$ only uses the first 72 plaintext chars
>
>all others (MD5 $1$, SHA 256/512 $5$/$6$) seem to be using the entire 
>plaintext.
>

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
