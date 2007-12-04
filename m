From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC] argz(3) and envz(3)
Date: Tue, 4 Dec 2007 06:45:43 +0100
Message-ID: <cfd18e0f0712032145h7c006136qb086f914233eee8e@mail.gmail.com>
References: <36ca99e90712031419o6d26da36n4b6bf0fc3947196b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <36ca99e90712031419o6d26da36n4b6bf0fc3947196b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Dec 3, 2007 11:19 PM, Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hello,
>
> the argz_*(3) pages references the envz(3) in the See ALSO section,
> and the other way around to, but booth argz(3) and envz(3) pages do
> not exists.
>
> This could be fixed by rename man3/argz_add.3 to man3/argz.3, add a
> new man3/argz_add.3 with a .so to man3/argz.3, and change all
> references of the man3/argz_*.3 pages too.
> The same for envz.3.
>
> The patch for this is a little big, but trivial.
>
> Should I send it?

Hello Bert,

No need to send the patch.  I'll either fix as you suggest, or name
the argz.3 and envz.3 pages as .'so links.

Thanks for spotting this!

Cheers,

Michael


-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
-
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
