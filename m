From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] cpuset: add missing 'cpuset.' prefix some flags
Date: Mon, 4 Feb 2013 23:17:22 +0100
Message-ID: <20130204221722.GN17324@glenfiddich.mraw.org>
References: <1360015082-1322-1-git-send-email-spaillard@debian.org>
 <CAKgNAkh_3wdezRJqapvgiaK8_YGfFAdMJWLF379QZa+Omq9AKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkh_3wdezRJqapvgiaK8_YGfFAdMJWLF379QZa+Omq9AKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Feb 04, 2013 at 11:09:15PM +0100, Michael Kerrisk (man-pages) wrote:
> On Mon, Feb 4, 2013 at 10:58 PM, Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:
> > See fix 4160df82b3 for Documentation/cgroups/cpusets.txt in kernel
> 
> I can't find that commit, and I'd need a bit more explanation of what
> this patch is about.

e21a05cb408bb9f244f11a0813d4b355dad0822e doc: cpuset: Update the cpuset flag file
http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git;a=commitdiff;h=e21a05cb408bb9f244f11a0813d4b355dad0822e 

This prefix can be observed from the cpuset sysfs entries.

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
