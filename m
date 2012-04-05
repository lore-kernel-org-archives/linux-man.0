From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [RFC PATCH] hrtimers: system-wide and per-task hrtimer slacks
Date: Wed, 4 Apr 2012 17:10:13 -0700
Message-ID: <20120404171013.ac08575d.akpm@linux-foundation.org>
References: <1329724172-27690-1-git-send-email-dmitry.antipov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329724172-27690-1-git-send-email-dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Antipov <dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, 20 Feb 2012 11:49:32 +0400
Dmitry Antipov <dmitry.antipov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> This patch proposes a system-wide sysctl-aware default for the
> high-resolution timer slack value, which may be changed from 0
> to HRTIMER_MAX_SLACK nanoseconds. Default system-wide and per-task
> values are HRTIMER_DEFAULT_SLACK. Per-task value isn't inherited
> across fork(); instead, newborn task uses system-wide value by
> default, and newborn thread uses it's group leader value.

Well..  there are some back-incompatibilities here. 
prctl(PR_SET_TIMERSLACK, -1) used to restore current's slack setting to
whatever-we-inherited-at-fork, but that has been removed.  What are the
implications of this, and did we need to do it?

If we do make changes in this area then the prctl manpage should be
updated, please.  And if
http://www.spinics.net/lists/linux-man/msg01149.html represents the
current state of that manpage then it should be updated anyway - that
entry doesn't say anything about the (arg2 <= 0) case.


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
