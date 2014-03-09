From: Marius Gaubas <marius-PI1xv8u4z2FbJaZ9Qiajs9BPR1lH4CV8@public.gmane.org>
Subject: Re: man 2 stat
Date: Sun, 9 Mar 2014 20:24:49 +0000
Message-ID: <20140309202449.GB2447@zeus.siriusdev.com>
References: <20140309202120.GA2447@zeus.siriusdev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140309202120.GA2447-/zl7Sl5F5BR9OMYREy7PttBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Mar 09, 2014 at 08:21:20PM +0000, Marius Gaubas wrote:
> 1. nlink_t st_nlink member goes after mode_t st_mode, not before @struct stat
Apologies, the correct statement is:

  nlink_t st_nlink member is before mode_t st_mode, not after @struct stat
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
