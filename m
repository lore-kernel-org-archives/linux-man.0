From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] kexec_load manpage
Date: Sun, 31 Oct 2010 07:14:26 +0100
Message-ID: <AANLkTikq=WW3m+3P5tfepef=SFCjH=VMsOhKNNGQJo3B@mail.gmail.com>
References: <20100619132633.GA24277@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100619132633.GA24277-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Sat, Jun 19, 2010 at 3:26 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> Here are the beginnings of a kexec_load manpage.

Thanks. I have added this page to the set. In another reply, I'll show
some revisions I made to the page.

> Probably needs some more review from Eric and may need some additional
> information.

I will pull Eric's comments into the page.

> The syscall is actually only usable with a kernel patch to export
> the header I just sent separately.

Will this patch make it in?

> Also added the kexec subcall to reboot(2)

Applied.

The changes will be in man-pages 3.30.

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
