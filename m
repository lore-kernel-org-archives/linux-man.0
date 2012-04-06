From: Dmitry Antipov <dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] hrtimers: system-wide and per-task hrtimer slacks
Date: Fri, 06 Apr 2012 13:14:46 +0400
Message-ID: <4F7EB406.5020703@linaro.org>
References: <1329724172-27690-1-git-send-email-dmitry.antipov@linaro.org> <20120404171013.ac08575d.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120404171013.ac08575d.akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/05/2012 04:10 AM, Andrew Morton wrote:

> Well..  there are some back-incompatibilities here.
> prctl(PR_SET_TIMERSLACK, -1) used to restore current's slack setting to
> whatever-we-inherited-at-fork, but that has been removed.  What are the
> implications of this, and did we need to do it?

It seems you're looking at the previous version of this patch
(http://lkml.org/lkml/2012/2/20/55). Latest proposal is
http://lwn.net/Articles/484162/, which defines PR_SET_TIMERSLACK
action as:
...
case PR_SET_TIMERSLACK:
         if (arg2 <= 0)
                 current->timer_slack_ns =
                         default_timer_slack_ns;
         else if (arg2 <= HRTIMER_MAX_SLACK)
                 current->timer_slack_ns = arg2;
         else
                 error = -EINVAL;
         break;
...

> If we do make changes in this area then the prctl manpage should be
> updated, please.  And if
> http://www.spinics.net/lists/linux-man/msg01149.html represents the
> current state of that manpage then it should be updated anyway - that
> entry doesn't say anything about the (arg2<= 0) case.

I sent a patch for man pages too, it should be one of the recent posts
at http://www.spinics.net/lists/linux-man/index.html.

Dmitry


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
