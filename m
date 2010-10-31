From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] kexec_load manpage
Date: Sun, 31 Oct 2010 07:19:58 +0100
Message-ID: <AANLkTi=eT_6UjgLsrOtQt833xeTOkjDvHXvd=xbEZ34c@mail.gmail.com>
References: <20100619132633.GA24277@basil.fritz.box> <m1mxuqu8yr.fsf@fess.ebiederm.org>
 <20100619194532.GQ18946@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100619194532.GQ18946-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kexec Mailing List <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jun 19, 2010 at 9:45 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> On Sat, Jun 19, 2010 at 12:18:52PM -0700, Eric W. Biederman wrote:
>> Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> writes:
>>
>> > Here are the beginnings of a kexec_load manpage.
>> >
>> > Probably needs some more review from Eric and may need some additional
>> > information.
>> >
>> > The syscall is actually only usable with a kernel patch to export
>> > the header I just sent separately.
>>
>> The syscall has been used for years with a separate non-kernel header.
>
> Yes but that's not a sane interface that can be documented.

Agreed. Surely the right thing to do is export the proper header?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
