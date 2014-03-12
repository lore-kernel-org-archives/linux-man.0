From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: SuSE O_DIRECT|O_NONBLOCK overload
Date: Wed, 12 Mar 2014 04:00:15 -0700
Message-ID: <20140312110015.GA29907@infradead.org>
References: <20140130132620.GA6031@infradead.org>
 <20140130132630.GB6031@infradead.org>
 <x49iorp3fhm.fsf@segfault.boston.devel.redhat.com>
 <20140308155240.GA32297@infradead.org>
 <CAMM=eLewbtK7LiNZCXo=hm-sjVU2+MN+xTFuxb89mDA1iS3r0w@mail.gmail.com>
 <531B74B6.4070004@suse.de>
 <20140312102849.GA26509@infradead.org>
 <53203BE5.402@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53203BE5.402-l3A5Bk7waGM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

The SLES12 tree has various patches to implement special
O_DIRECT|O_NONBLOCK semantics for block devices:

	https://gitorious.org/opensuse/kernel-source/source/806eab3e4b02e798c1ae942440051f81c822ca35:patches.suse/block-nonblock-causes-failfast

this seems genuinely useful and I'd be really happy if people would do
this work upstream for two reasons:

 a) implementing different semantics only in a vendor kernel is a
    nightmare.  No proper way to document it in the man pages for
    example, and silent breakage of applications that expect it to be
    present, or even more nasty not present.
 b) Which brings us to: we had various issues with adding O_NONBLOCK to
    files that didn't support it before.  How well was this whole feature
    tested?

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
