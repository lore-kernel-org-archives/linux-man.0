From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [PATCH] MAN: Clarify mremap.2 prototype
Date: Fri, 11 Jun 2010 10:38:10 +0200
Message-ID: <20100611083810.GG6864@basil.fritz.box>
References: <20100603090818.GA4741@basil.fritz.box> <AANLkTim4NYbt66oTsxS7ECTzi63gpli6GuSOBgR2ZlR7@mail.gmail.com> <20100610171503.GG19561@basil.fritz.box> <AANLkTiltSNhhRO0wxqLA0nNAPv70LBclMQTVKUXQd5hE@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTiltSNhhRO0wxqLA0nNAPv70LBclMQTVKUXQd5hE-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> > This change will give less information to the reader than the patch. It doesn't
> > seem like a improvement to me.
> 
> It gives less information than your patch, because your patch repeated
> information that was already in the page.

The correct prototype for the 5 argument option was and is still missing.
Text is no replacement for a correct prototype.

BTW I was prompted to this patch by a real world incident, someone
overlooking the fifth argument.

-Andi

-- 
ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org -- Speaking for myself only.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
