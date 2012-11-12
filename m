From: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Subject: Re: /proc/[pid]/oom_adj and /proc/[pid]/oom_score_adj
Date: Mon, 12 Nov 2012 12:26:12 +0100
Message-ID: <20121112112612.GA29307@gaara.hadrons.org>
References: <CAP737oKmr2msE0SvFh4kiCf+psg25hobVEDGvZ5-sg=TmL1OQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAP737oKmr2msE0SvFh4kiCf+psg25hobVEDGvZ5-sg=TmL1OQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Bique <bique.alexandre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

On Mon, 2012-11-12 at 12:09:45 +0100, Alexandre Bique wrote:
> Recent Linux kernels says:
> 
> /proc/2978/oom_adj is deprecated, please use /proc/2978/oom_score_adj instead.
> 
> But man proc(5) doesn't explain how to use oom_score_adj. Can someone
> update man proc(5)?

Hmm, I did this some time ago, and thought I had sent it, but it
appears I only send a patch to document /proc/PID/exe with deleted
pathnames.

I'll review the wording, because I don't remember if there was
something missing/wrong, and try to post it later today.

thanks,
guillem
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
