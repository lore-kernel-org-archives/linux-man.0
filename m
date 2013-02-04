From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] cpuset: add missing 'cpuset.' prefix some flags
Date: Mon, 4 Feb 2013 23:13:21 +0100
Message-ID: <20130204221321.GM17324@glenfiddich.mraw.org>
References: <1360015082-1322-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360015082-1322-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Feb 04, 2013 at 10:58:02PM +0100, Simon Paillard wrote:
> See fix 4160df82b3 for Documentation/cgroups/cpusets.txt in kernel
> ---

Notes:
* To avoid too heavy phrasing, only direct references like file have been
fixed, not all references. Michael, if you think all reference to flags shall
be prefixed, tell me.

* I cannot find a kernel version without 'cpuset.' prefix commit in
cpuset.c, but I may miss something.
http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git;a=history;f=kernel/cpuset.c 

* We can find sources of improvements from the changelog of cpuset doc in
kernel, that's not a surprise :)
http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git;a=history;f=Documentation/cgroups/cpusets.txt
--> IMO the manpage should reference the libraries like libcgroup or python
cpuset, but I wonder about the formatting

-- 
Simon Paillard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
