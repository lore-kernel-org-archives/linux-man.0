From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] MAN: Clarify mremap.2 prototype
Date: Fri, 11 Jun 2010 10:32:50 +0200
Message-ID: <AANLkTiltSNhhRO0wxqLA0nNAPv70LBclMQTVKUXQd5hE@mail.gmail.com>
References: <20100603090818.GA4741@basil.fritz.box> <AANLkTim4NYbt66oTsxS7ECTzi63gpli6GuSOBgR2ZlR7@mail.gmail.com>
	<20100610171503.GG19561@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100610171503.GG19561-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Thu, Jun 10, 2010 at 7:15 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
>> Thanks for the patch. I agree that mremap() could be improved
>> somewhat. But note that new_size was already described in the page. I
>> applied the following simpler patch.
>
> This change will give less information to the reader than the patch. It doesn't
> seem like a improvement to me.

It gives less information than your patch, because your patch repeated
information that was already in the page.

>> The change will be in man-pages-3.25.
>
> How about all the other missing patches?

Getting there...

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
