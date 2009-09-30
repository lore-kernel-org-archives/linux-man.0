From: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Subject: Re: sync_file_range.2: add some big WARNINGS
Date: Wed, 30 Sep 2009 17:47:49 +0200
Message-ID: <20090930154749.GA6349@lst.de>
References: <20090827180116.GB31605@lst.de> <cfd18e0f0909192234l57ad4ec0rda34dcb83e355c5e@mail.gmail.com> <20090921131519.875b4608.akpm@linux-foundation.org> <20090922114052.GA1521@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090922114052.GA1521-jcswGhMUV9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, hch-jcswGhMUV9g@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

So what are we going to do with it?  The current manpage still suggests
it might actuall be safe for overwrites which it really isn't.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
