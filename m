From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cpuset: add missing 'cpuset.' prefix some flags
Date: Fri, 8 Feb 2013 10:09:03 +0100
Message-ID: <CAKgNAkjrY0JO=sqUEbLD078i7BdAo4e4jOpb0zkAAk-pAwuN0A@mail.gmail.com>
References: <1360015082-1322-1-git-send-email-spaillard@debian.org>
 <CAKgNAkh_3wdezRJqapvgiaK8_YGfFAdMJWLF379QZa+Omq9AKg@mail.gmail.com> <20130204221722.GN17324@glenfiddich.mraw.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130204221722.GN17324-8MNqHwMchPhGJ/Ie3qa20WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Feb 4, 2013 at 11:17 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Feb 04, 2013 at 11:09:15PM +0100, Michael Kerrisk (man-pages) wrote:
>> On Mon, Feb 4, 2013 at 10:58 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
>> > See fix 4160df82b3 for Documentation/cgroups/cpusets.txt in kernel
>>
>> I can't find that commit, and I'd need a bit more explanation of what
>> this patch is about.
>
> e21a05cb408bb9f244f11a0813d4b355dad0822e doc: cpuset: Update the cpuset flag file
> http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git;a=commitdiff;h=e21a05cb408bb9f244f11a0813d4b355dad0822e
>
> This prefix can be observed from the cpuset sysfs entries.

Okay -- I've applied this patch. Thanks Simon.

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
