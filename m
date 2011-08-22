From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: +
	prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
	.patch added to -mm tree
Date: Mon, 22 Aug 2011 13:14:02 +0200
Message-ID: <20110822111402.GA13248@redhat.com>
References: <1313691091.1107.9.camel@mop> <20110818184857.GA12094@redhat.com> <1313717521.991.4.camel@mop> <20110819122503.GA8411@redhat.com> <CAPXgP11KC2fTWBVYo6CBXe924YAyTGhx9=UTBDf4cP5Acuo0NA@mail.gmail.com> <20110819131339.GB8411@redhat.com> <1313763653.1119.12.camel@mop> <20110819145815.GA15420@redhat.com> <20110820153331.GA22577@redhat.com> <1313951606.16175.7.camel@mop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1313951606.16175.7.camel@mop>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: Lennart Poettering <mzxreary-uLTowLwuiw4b1SvskN2V4Q@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/21, Kay Sievers wrote:
>
> version 5:
> - add back check for &init_task

Reviewed-by: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>





Just one note, to avoid the "doesn't look correct" questions.

> @@ -987,6 +987,9 @@ static int copy_signal(unsigned long clo
>  	sig->oom_score_adj = current->signal->oom_score_adj;
>  	sig->oom_score_adj_min = current->signal->oom_score_adj_min;
>
> +	sig->has_child_subreaper = current->signal->has_child_subreaper ||
> +				   current->signal->is_child_subreaper;

This assumes that current == parent. But this is not true with
CLONE_PARENT. If a task does prctl(REAPER) + clone(CLONE_PARENT)
->has_child_subreaper == T is not exactly right.

But I think this is fine and we do not care, a "wrong"
->has_child_subreaper is harmless and it can't be 100% correct in
any case.

I believe the patch is correct.

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
