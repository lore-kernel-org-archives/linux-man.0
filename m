From: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] madvise.2: update the description for MADV_REMOVE
Date: Tue, 24 Jun 2014 17:02:38 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1406241702190.22030@chino.kir.corp.google.com>
References: <53AA0D5B.6060504@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53AA0D5B.6060504-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Sheng-Hui <shhuiw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, 25 Jun 2014, Wang Sheng-Hui wrote:

> 
> Currently we have more filesystems supporting fallcate, e.g ext4/btrfs,
> which can response to MADV_REMOVE gracefully.
> 
> And if filesystems don't support fallocate, the return error would be
> EOPNOTSUPP, instead of ENOSYS.
> 
> Signed-off-by: Wang Sheng-Hui <shhuiw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Could you reply to the thread where this is removed from the kernel source 
on LKML so others know that you have taken care of it?

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
